extends Node2D

# Game Constants
const TILE_SIZE = 20
const COLS = 40
const ROWS = 30
const MAX_TORCH = 100.0
const BASE_TORCH_BURN_RATE = 2.4
const FUEL_AMOUNT = 25.0
const BASE_ENEMY_MOVE_INTERVAL = 0.8
const MAX_LEVELS = 3
const ATTACK_COST = 10.0
const ENEMY_RESPAWN_TIME = 5.0

# Tile Types
enum TileType { WALL, FLOOR, EXIT, FUEL }

# Game State
var map: Array = []
var rooms: Array = []
var fuels: Array = []
var player_pos: Vector2i
var exit_pos: Vector2i
var enemy_pos: Vector2i
var enemy_alive: bool = true
var enemy_respawn_timer: float = 0.0
var torch: float = MAX_TORCH
var fuel_collected: int = 0
var total_fuel_collected: int = 0
var level: int = 1
var game_over: bool = false
var game_won: bool = false
var game_victory: bool = false
var showing_upgrade: bool = false

# Level Parameters
var torch_burn_rate: float = BASE_TORCH_BURN_RATE
var enemy_move_interval: float = BASE_ENEMY_MOVE_INTERVAL
var enemy_move_timer: float = 0.0

# Upgrades
var speed_boost: int = 0
var torch_efficiency: float = 1.0
var vision_boost: int = 0

# Player facing direction
var player_facing: String = "down"

# Nodes
@onready var player: CharacterBody2D = $Player
@onready var enemy: CharacterBody2D = $Enemy
@onready var exit_marker: Marker2D = $ExitMarker
@onready var ui = $UI
@onready var light = $Player/PointLight2D
@onready var camera = $Camera2D

func _ready():
	restart_game()

func _process(delta):
	if game_over or game_won or game_victory or showing_upgrade:
		return
	
	# Update torch
	torch -= torch_burn_rate * delta
	if torch <= 0:
		torch = 0
		game_over = true
		ui.show_game_over()
	
	# Update enemy movement
	enemy_move_timer += delta
	if enemy_alive and enemy_move_timer >= enemy_move_interval:
		enemy_move_timer = 0
		update_enemy()
	
	# Update enemy respawn
	if not enemy_alive and enemy_respawn_timer > 0:
		enemy_respawn_timer -= delta
		if enemy_respawn_timer <= 0:
			respawn_enemy()
	
	# Update UI
	update_ui()
	update_light_radius()
	queue_redraw()

func _input(event):
	if game_over or game_won or game_victory or showing_upgrade:
		if event.is_action_pressed("restart"):
			restart_game()
		return
	
	if event.is_action_pressed("move_up"):
		player_facing = "up"
		move_player(0, -1)
	elif event.is_action_pressed("move_down"):
		player_facing = "down"
		move_player(0, 1)
	elif event.is_action_pressed("move_left"):
		player_facing = "left"
		move_player(-1, 0)
	elif event.is_action_pressed("move_right"):
		player_facing = "right"
		move_player(1, 0)
	elif event.is_action_pressed("attack"):
		attack()

func restart_game():
	game_over = false
	game_won = false
	game_victory = false
	showing_upgrade = false
	torch = MAX_TORCH
	fuel_collected = 0
	total_fuel_collected = 0
	level = 1
	speed_boost = 0
	torch_efficiency = 1.0
	vision_boost = 0
	player_facing = "down"
	
	ui.hide_all_screens()
	update_level_params()
	generate_level()
	update_ui()

func update_level_params():
	torch_burn_rate = BASE_TORCH_BURN_RATE * (1.0 + (level - 1) * 0.3) / torch_efficiency
	enemy_move_interval = BASE_ENEMY_MOVE_INTERVAL * pow(0.85, level - 1)

func generate_level():
	# Reset state
	map.clear()
	rooms.clear()
	fuels.clear()
	enemy_alive = true
	enemy_respawn_timer = 0
	enemy.visible = true
	
	# Initialize map with walls
	for y in range(ROWS):
		var row = []
		for x in range(COLS):
			row.append(TileType.WALL)
		map.append(row)
	
	# Generate rooms
	generate_rooms()
	connect_rooms()
	
	# Place player in first room
	var start_room = rooms[0]
	player_pos = Vector2i(
		int(start_room.x + start_room.w / 2),
		int(start_room.y + start_room.h / 2)
	)
	
	# Place exit in last room
	var end_room = rooms[rooms.size() - 1]
	exit_pos = Vector2i(
		int(end_room.x + end_room.w / 2),
		int(end_room.y + end_room.h / 2)
	)
	map[exit_pos.y][exit_pos.x] = TileType.EXIT
	
	# Place fuel pickups
	var fuel_count = 3 + randi() % 3 + level
	for i in range(fuel_count):
		var pos = find_empty_spot()
		fuels.append(pos)
		map[pos.y][pos.x] = TileType.FUEL
	
	# Place enemy far from player
	enemy_pos = find_empty_spot_far_from_player(15)
	
	# Refill torch slightly
	torch = min(MAX_TORCH, torch + 30)
	
	# Update visual positions
	update_visual_positions()

func generate_rooms():
	var room_count = int((6 + randi() % 4) * (1.0 + (level - 1) * 0.2))
	
	for i in range(room_count):
		var attempts = 0
		while attempts < 50:
			var w = 4 + randi() % 6
			var h = 4 + randi() % 6
			var x = 1 + randi() % (COLS - w - 2)
			var y = 1 + randi() % (ROWS - h - 2)
			var new_room = { "x": x, "y": y, "w": w, "h": h }
			
			if not rooms_intersect(new_room):
				rooms.append(new_room)
				for ry in range(y, y + h):
					for rx in range(x, x + w):
						map[ry][rx] = TileType.FLOOR
				break
			attempts += 1

func rooms_intersect(a: Dictionary) -> bool:
	for r in rooms:
		if a.x - 1 < r.x + r.w + 1 and a.x + a.w + 1 > r.x - 1 and \
		   a.y - 1 < r.y + r.h + 1 and a.y + a.h + 1 > r.y - 1:
			return true
	return false

func connect_rooms():
	for i in range(rooms.size() - 1):
		var a = rooms[i]
		var b = rooms[i + 1]
		var ax = int(a.x + a.w / 2)
		var ay = int(a.y + a.h / 2)
		var bx = int(b.x + b.w / 2)
		var by = int(b.y + b.h / 2)
		
		if randf() < 0.5:
			carve_corridor(ax, ay, bx, ay)
			carve_corridor(bx, ay, bx, by)
		else:
			carve_corridor(ax, ay, ax, by)
			carve_corridor(ax, by, bx, by)

func carve_corridor(x1: int, y1: int, x2: int, y2: int):
	var dx = sign(x2 - x1)
	var dy = sign(y2 - y1)
	var x = x1
	var y = y1
	
	while x != x2 or y != y2:
		map[y][x] = TileType.FLOOR
		if x != x2:
			x += dx
		elif y != y2:
			y += dy
	map[y][x] = TileType.FLOOR

func find_empty_spot() -> Vector2i:
	while true:
		var x = randi() % COLS
		var y = randi() % ROWS
		if map[y][x] == TileType.FLOOR:
			return Vector2i(x, y)

func find_empty_spot_far_from_player(min_dist: int) -> Vector2i:
	while true:
		var pos = find_empty_spot()
		var dist = abs(pos.x - player_pos.x) + abs(pos.y - player_pos.y)
		if dist >= min_dist:
			return pos

func move_player(dx: int, dy: int):
	var move_distance = 1 + speed_boost
	
	for i in range(move_distance):
		var new_x = player_pos.x + dx
		var new_y = player_pos.y + dy
		
		if new_x < 0 or new_x >= COLS or new_y < 0 or new_y >= ROWS:
			return
		if map[new_y][new_x] == TileType.WALL:
			return
		
		player_pos.x = new_x
		player_pos.y = new_y
		
		# Check for exit
		if new_x == exit_pos.x and new_y == exit_pos.y:
			on_reach_exit()
			return
		
		# Check for fuel pickup
		var fuel_index = -1
		for j in range(fuels.size()):
			if fuels[j].x == new_x and fuels[j].y == new_y:
				fuel_index = j
				break
		
		if fuel_index != -1:
			torch = min(MAX_TORCH, torch + FUEL_AMOUNT)
			fuel_collected += 1
			total_fuel_collected += 1
			fuels.remove_at(fuel_index)
			map[new_y][new_x] = TileType.FLOOR
			ui.show_floating_text("+25%", new_x * TILE_SIZE, new_y * TILE_SIZE)
	
	update_visual_positions()

func on_reach_exit():
	if level >= MAX_LEVELS:
		game_victory = true
		ui.show_victory(total_fuel_collected)
	else:
		showing_upgrade = true
		ui.show_level_complete()

func next_level():
	ui.hide_all_screens()
	ui.show_upgrade_screen()

func select_upgrade(type: String):
	match type:
		"speed":
			speed_boost += 1
		"efficiency":
			torch_efficiency *= 1.3
		"bright":
			vision_boost += 1
	
	level += 1
	fuel_collected = 0
	update_level_params()
	showing_upgrade = false
	ui.hide_all_screens()
	
	# Clear map for new level
	map.clear()
	generate_level()
	update_ui()

func attack():
	torch = max(0, torch - ATTACK_COST)
	
	# Calculate attack position
	var attack_x = player_pos.x
	var attack_y = player_pos.y
	
	match player_facing:
		"up": attack_y -= 1
		"down": attack_y += 1
		"left": attack_x -= 1
		"right": attack_x += 1
	
	# Show attack effect
	ui.show_attack_effect(attack_x * TILE_SIZE, attack_y * TILE_SIZE)
	
	# Check if enemy is hit
	if enemy_alive and enemy_pos.x == attack_x and enemy_pos.y == attack_y:
		kill_enemy()

func kill_enemy():
	enemy_alive = false
	ui.show_floating_text("KILL!", enemy_pos.x * TILE_SIZE, enemy_pos.y * TILE_SIZE - 10)
	enemy_respawn_timer = ENEMY_RESPAWN_TIME
	enemy.visible = false

func respawn_enemy():
	if game_over or game_won or game_victory:
		return
	enemy_alive = true
	enemy_pos = find_empty_spot_far_from_player(15)
	enemy.visible = true
	update_visual_positions()
	ui.show_floating_text("SPAWN", enemy_pos.x * TILE_SIZE, enemy_pos.y * TILE_SIZE - 10)

func update_enemy():
	if randf() < 0.3:
		return
	
	var dx = sign(player_pos.x - enemy_pos.x)
	var dy = sign(player_pos.y - enemy_pos.y)
	var moved = false
	
	# Check if enemy is in light
	var dist_to_player = get_distance(enemy_pos.x, enemy_pos.y, player_pos.x, player_pos.y)
	var light_radius = get_light_radius()
	var in_light = dist_to_player <= light_radius
	
	if in_light:
		# Flee from player
		dx = -dx
		dy = -dy
	
	if dx != 0 and randf() < 0.5:
		var new_x = enemy_pos.x + dx
		if can_move_to(new_x, enemy_pos.y):
			enemy_pos.x = new_x
			moved = true
	
	if not moved and dy != 0:
		var new_y = enemy_pos.y + dy
		if can_move_to(enemy_pos.x, new_y):
			enemy_pos.y = new_y
			moved = true
	
	if not moved and dx != 0:
		var new_x = enemy_pos.x + dx
		if can_move_to(new_x, enemy_pos.y):
			enemy_pos.x = new_x
	
	# Check collision with player
	if enemy_pos.x == player_pos.x and enemy_pos.y == player_pos.y:
		torch = 0
		game_over = true
		ui.show_game_over()
	
	update_visual_positions()

func can_move_to(x: int, y: int) -> bool:
	if x < 0 or x >= COLS or y < 0 or y >= ROWS:
		return false
	return map[y][x] != TileType.WALL

func get_distance(x1: int, y1: int, x2: int, y2: int) -> float:
	return sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)

func get_light_radius() -> float:
	var base_radius = 8.0 + vision_boost
	var min_radius = 2.0
	var torch_ratio = torch / MAX_TORCH
	return min_radius + (base_radius - min_radius) * torch_ratio

func update_light_radius():
	var radius = get_light_radius()
	light.texture_scale = radius / 8.0

func update_visual_positions():
	player.position = Vector2(player_pos.x * TILE_SIZE + TILE_SIZE / 2, player_pos.y * TILE_SIZE + TILE_SIZE / 2)
	enemy.position = Vector2(enemy_pos.x * TILE_SIZE + TILE_SIZE / 2, enemy_pos.y * TILE_SIZE + TILE_SIZE / 2)
	exit_marker.position = Vector2(exit_pos.x * TILE_SIZE + TILE_SIZE / 2, exit_pos.y * TILE_SIZE + TILE_SIZE / 2)

func update_ui():
	ui.update_torch(torch, MAX_TORCH)
	ui.update_fuel(fuel_collected)
	ui.update_level(level)

func _draw():
	# Draw the map
	var light_radius = get_light_radius()
	
	for y in range(ROWS):
		for x in range(COLS):
			var px = x * TILE_SIZE
			var py = y * TILE_SIZE
			var dist = get_distance(x, y, player_pos.x, player_pos.y)
			var visible = dist <= light_radius
			
			if visible:
				var intensity = max(0.0, 1.0 - (dist / light_radius))
				
				match map[y][x]:
					TileType.WALL:
						var color = Color(0.157, 0.137, 0.118) * intensity
						draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), color)
						# Top highlight
						draw_rect(Rect2(px, py, TILE_SIZE, 3), Color(0.235, 0.196, 0.157) * intensity)
					TileType.FLOOR:
						var floor_color = Color(0.118, 0.098, 0.078) * intensity
						draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), floor_color)
					TileType.EXIT:
						var pulse = 0.7 + 0.3 * sin(Time.get_time_dict_from_system()["second"] * 4)
						var exit_color = Color(0, 0.4 * intensity * pulse, 0)
						draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), Color(0.078, 0.157, 0.078) * intensity)
						# Draw door symbol
						draw_rect(Rect2(px + 4, py + 4, 12, 12), exit_color)
					TileType.FUEL:
						draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), Color(0.118, 0.098, 0.078) * intensity)
						# Draw fuel symbol
						draw_rect(Rect2(px + 6, py + 6, 8, 8), Color(1, 0.8, 0.2) * intensity)
						
			elif map[y][x] == TileType.WALL:
				draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), Color(0.067, 0.067, 0.067))
	
	# Draw exit
	var exit_dist = get_distance(exit_pos.x, exit_pos.y, player_pos.x, player_pos.y)
	if exit_dist <= light_radius:
		var exit_intensity = max(0.0, 1.0 - (exit_dist / light_radius))
		draw_rect(Rect2(exit_pos.x * TILE_SIZE + 4, exit_pos.y * TILE_SIZE + 4, 12, 12), Color(0, 1, 0) * exit_intensity)
	
	# Draw enemy if visible and alive
	if enemy_alive:
		var enemy_dist = get_distance(enemy_pos.x, enemy_pos.y, player_pos.x, player_pos.y)
		if enemy_dist <= light_radius:
			var enemy_intensity = max(0.0, 1.0 - (enemy_dist / light_radius))
			draw_circle(Vector2(enemy_pos.x * TILE_SIZE + TILE_SIZE/2, enemy_pos.y * TILE_SIZE + TILE_SIZE/2), 8, Color(0.8, 0.2, 0.2) * enemy_intensity)
			# Draw eye
			draw_circle(Vector2(enemy_pos.x * TILE_SIZE + TILE_SIZE/2 - 2, enemy_pos.y * TILE_SIZE + TILE_SIZE/2 - 2), 2, Color(1, 1, 1) * enemy_intensity)
			draw_circle(Vector2(enemy_pos.x * TILE_SIZE + TILE_SIZE/2 + 2, enemy_pos.y * TILE_SIZE + TILE_SIZE/2 - 2), 2, Color(1, 1, 1) * enemy_intensity)
	
	# Draw player flame glow
	var player_px = player_pos.x * TILE_SIZE + TILE_SIZE / 2
	var player_py = player_pos.y * TILE_SIZE + TILE_SIZE / 2
	
	# Player body
	draw_circle(Vector2(player_px, player_py), 8, Color(1, 0.67, 0.27))
	
	# Draw darkness overlay
	for y in range(ROWS):
		for x in range(COLS):
			var px = x * TILE_SIZE
			var py = y * TILE_SIZE
			var dist = get_distance(x, y, player_pos.x, player_pos.y)
			
			if dist > light_radius * 0.5:
				var darkness = min(0.95, (dist - light_radius * 0.5) / (light_radius * 1.0))
				draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), Color(0, 0, 0, darkness))
