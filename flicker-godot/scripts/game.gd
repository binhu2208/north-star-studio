extends Node2D

# ============================================================================
# FLICKER - GODOT EDITION
# Integrated Build v1.0
# Balance: Hideo's Design | Art: Yoshi | Code: John
# ============================================================================

# Game Constants
const TILE_SIZE = 32  # Updated for 32x32 pixel art
const COLS = 25  # Adjusted for larger tiles
const ROWS = 19
const MAX_TORCH = 100.0

# Balance Values (from Hideo's design)
const BASE_TORCH_BURN_RATE = 5.0  # 5% per second (idle)
const MOVE_BURN_MULTIPLIER = 2.0  # 10% per second when moving
const ATTACK_COST = 15.0  # 15% per swing
const CRITICAL_THRESHOLD = 20.0  # Red zone threshold

# Fuel Pickup Types (from balance-sheet.md)
const FUEL_SMALL = 10.0   # Small Ember: +10%
const FUEL_MEDIUM = 25.0  # Medium Coal: +25%
const FUEL_LARGE = 50.0   # Large Log: +50%

# Enemy Balance (from Hideo's design)
const ENEMY_SPEED_WITH_TORCH = 0.7   # 0.7x player speed when torch lit
const ENEMY_SPEED_WITHOUT_TORCH = 1.3  # 1.3x player speed when torch out
const ENEMY_FLEE_DISTANCE = 4.0  # tiles
const DETECTION_TORCH = 8.0  # tiles when torch lit
const DETECTION_DARK = 12.0  # tiles when torch out
const ENEMY_RESPAWN_TIME = 5.0

# Level Scaling
const MAX_LEVELS = 3
const BASE_ENEMY_MOVE_INTERVAL = 0.8

# Upgrade Effects (from balance-sheet.md)
const SPEED_BOOST_AMOUNT = 0.2  # +20% per stack
const EFFICIENCY_BOOST_AMOUNT = 0.2  # -20% fuel consumption per stack
const BRIGHT_BOOST_AMOUNT = 0.3  # +30% light radius
const MAX_SPEED_STACKS = 3
const MAX_EFFICIENCY_STACKS = 2

# Tile Types
enum TileType { WALL, FLOOR, EXIT, FUEL_SMALL_TILE, FUEL_MEDIUM_TILE, FUEL_LARGE_TILE }

# Game State
var map: Array = []
var rooms: Array = []
var fuels: Array = []  # Now stores {pos: Vector2i, type: int, amount: float}
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
var is_moving: bool = false

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
	
	# Update torch with movement multiplier
	var current_burn = torch_burn_rate
	if is_moving:
		current_burn *= MOVE_BURN_MULTIPLIER
	torch -= current_burn * delta
	is_moving = false  # Reset for next frame
	
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
		is_moving = true
		move_player(0, -1)
	elif event.is_action_pressed("move_down"):
		player_facing = "down"
		is_moving = true
		move_player(0, 1)
	elif event.is_action_pressed("move_left"):
		player_facing = "left"
		is_moving = true
		move_player(-1, 0)
	elif event.is_action_pressed("move_right"):
		player_facing = "right"
		is_moving = true
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
	ui.reset_timer()
	update_level_params()
	generate_level()
	update_ui()

func update_level_params():
	# Apply difficulty scaling per level
	var level_multiplier = 1.0 + (level - 1) * 0.3
	torch_burn_rate = (BASE_TORCH_BURN_RATE * level_multiplier) / torch_efficiency
	
	# Enemy gets faster each level
	enemy_move_interval = BASE_ENEMY_MOVE_INTERVAL * pow(0.85, level - 1) / get_enemy_speed_multiplier()

func get_enemy_speed_multiplier() -> float:
	# Returns speed multiplier based on level
	match level:
		1: return 0.85  # Level 1: slower
		2: return 1.0   # Level 2: normal
		3: return 1.15  # Level 3: faster
		_: return 1.0

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
	
	# Place fuel pickups with weighted distribution per level
	place_fuel_pickups()
	
	# Place enemy far from player
	enemy_pos = find_empty_spot_far_from_player(10)
	
	# Refill torch slightly between levels
	torch = min(MAX_TORCH, torch + 30)
	
	# Update visual positions
	update_visual_positions()

func place_fuel_pickups():
	# Fuel count decreases per level (scarcity increases)
	var fuel_count = 4 - (level - 1)  # Level 1: 4, Level 2: 3, Level 3: 2
	
	for i in range(fuel_count):
		var pos = find_empty_spot()
		var fuel_type = roll_fuel_type()
		var amount = FUEL_SMALL
		var tile_type = TileType.FUEL_SMALL_TILE
		
		match fuel_type:
			0:  # Small Ember (60% base, more common on L1)
				amount = FUEL_SMALL
				tile_type = TileType.FUEL_SMALL_TILE
			1:  # Medium Coal (30% base)
				amount = FUEL_MEDIUM
				tile_type = TileType.FUEL_MEDIUM_TILE
			2:  # Large Log (10% base, more common on L3)
				amount = FUEL_LARGE
				tile_type = TileType.FUEL_LARGE_TILE
		
		fuels.append({"pos": pos, "type": fuel_type, "amount": amount, "tile_type": tile_type})
		map[pos.y][pos.x] = tile_type

func roll_fuel_type() -> int:
	# Adjust weights based on level
	var roll = randf()
	
	match level:
		1:  # Level 1: More small embers
			if roll < 0.70: return 0  # 70% Small
			elif roll < 0.95: return 1  # 25% Medium
			else: return 2  # 5% Large
		2:  # Level 2: Balanced
			if roll < 0.50: return 0  # 50% Small
			elif roll < 0.85: return 1  # 35% Medium
			else: return 2  # 15% Large
		3:  # Level 3: More large logs
			if roll < 0.30: return 0  # 30% Small
			elif roll < 0.60: return 1  # 30% Medium
			else: return 2  # 40% Large
		_:
			if roll < 0.60: return 0
			elif roll < 0.90: return 1
			else: return 2

func generate_rooms():
	# Room count scales slightly with level
	var room_count = int((5 + randi() % 3) * (1.0 + (level - 1) * 0.1))
	
	for i in range(room_count):
		var attempts = 0
		while attempts < 50:
			var w = 4 + randi() % 5
			var h = 4 + randi() % 5
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
	var x = 0
	var y = 0
	while true:
		x = randi() % COLS
		y = randi() % ROWS
		if map[y][x] == TileType.FLOOR:
			return Vector2i(x, y)
	return Vector2i(x, y)

func find_empty_spot_far_from_player(min_dist: int) -> Vector2i:
	var pos = Vector2i(0, 0)
	while true:
		pos = find_empty_spot()
		var dist = abs(pos.x - player_pos.x) + abs(pos.y - player_pos.y)
		if dist >= min_dist:
			return pos
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
		check_fuel_pickup(new_x, new_y)
	
	update_visual_positions()

func check_fuel_pickup(x: int, y: int):
	for i in range(fuels.size()):
		var fuel = fuels[i]
		if fuel.pos.x == x and fuel.pos.y == y:
			torch = min(MAX_TORCH, torch + fuel.amount)
			fuel_collected += 1
			total_fuel_collected += 1
			fuels.remove_at(i)
			map[y][x] = TileType.FLOOR
			
			# Show floating text with amount
			var label = "+%d%%" % int(fuel.amount)
			ui.show_floating_text(label, x * TILE_SIZE, y * TILE_SIZE)
			break

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
			if speed_boost < MAX_SPEED_STACKS:
				speed_boost += 1
		"efficiency":
			if torch_efficiency < (1.0 + MAX_EFFICIENCY_STACKS * EFFICIENCY_BOOST_AMOUNT):
				torch_efficiency *= (1.0 + EFFICIENCY_BOOST_AMOUNT)
		"bright":
			if vision_boost == 0:  # Can only buy once
				vision_boost = 1
	
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
	enemy_pos = find_empty_spot_far_from_player(10)
	enemy.visible = true
	update_visual_positions()
	ui.show_floating_text("SPAWN", enemy_pos.x * TILE_SIZE, enemy_pos.y * TILE_SIZE - 10)

func update_enemy():
	# Skip movement randomly for less predictable behavior
	if randf() < 0.2:
		return
	
	var dist_to_player = get_distance(enemy_pos.x, enemy_pos.y, player_pos.x, player_pos.y)
	var light_radius = get_light_radius()
	var in_light = dist_to_player <= light_radius
	var torch_critical = torch <= CRITICAL_THRESHOLD
	
	# Determine AI state
	var state = "PATROL"
	if in_light and not torch_critical:
		state = "FLEE"
	elif dist_to_player <= get_detection_radius():
		if not in_light or torch_critical:
			state = "HUNT"
		else:
			state = "STALK"
	
	# Execute behavior based on state
	var dx = 0
	var dy = 0
	
	match state:
		"FLEE":
			# Move away from player
			dx = -sign(player_pos.x - enemy_pos.x)
			dy = -sign(player_pos.y - enemy_pos.y)
		"HUNT":
			# Move toward player aggressively
			dx = sign(player_pos.x - enemy_pos.x)
			dy = sign(player_pos.y - enemy_pos.y)
		"STALK":
			# Circle at edge of light
			if randf() < 0.5:
				dx = sign(player_pos.x - enemy_pos.x)
			else:
				dy = sign(player_pos.y - enemy_pos.y)
			# Slow movement when stalking
			if randf() < 0.5:
				return
		"PATROL":
			# Random movement
			dx = randi() % 3 - 1
			dy = randi() % 3 - 1
	
	# Try to move
	var moved = false
	
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
	var base_radius = DETECTION_TORCH + (vision_boost * DETECTION_TORCH * BRIGHT_BOOST_AMOUNT)
	var min_radius = 2.0
	var torch_ratio = torch / MAX_TORCH
	return min_radius + (base_radius - min_radius) * torch_ratio

func get_detection_radius() -> float:
	# Enemy detects player further when torch is out
	if torch <= 0:
		return DETECTION_DARK
	return DETECTION_TORCH

func update_light_radius():
	var radius = get_light_radius()
	light.texture_scale = radius / 8.0

func update_visual_positions():
	player.position = Vector2(player_pos.x * TILE_SIZE + TILE_SIZE / 2, player_pos.y * TILE_SIZE + TILE_SIZE / 2)
	enemy.position = Vector2(enemy_pos.x * TILE_SIZE + TILE_SIZE / 2, enemy_pos.y * TILE_SIZE + TILE_SIZE / 2)
	exit_marker.position = Vector2(exit_pos.x * TILE_SIZE + TILE_SIZE / 2, exit_pos.y * TILE_SIZE + TILE_SIZE / 2)

func update_ui():
	ui.update_torch(torch, MAX_TORCH, torch <= CRITICAL_THRESHOLD)
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
						draw_rect(Rect2(px + 8, py + 8, 16, 16), exit_color)
					TileType.FUEL_SMALL_TILE:
						draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), Color(0.118, 0.098, 0.078) * intensity)
						draw_rect(Rect2(px + 10, py + 10, 12, 12), Color(1, 0.6, 0.2) * intensity)  # Small = orange
					TileType.FUEL_MEDIUM_TILE:
						draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), Color(0.118, 0.098, 0.078) * intensity)
						draw_rect(Rect2(px + 8, py + 8, 16, 16), Color(1, 0.4, 0.1) * intensity)  # Medium = red-orange
					TileType.FUEL_LARGE_TILE:
						draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), Color(0.118, 0.098, 0.078) * intensity)
						draw_rect(Rect2(px + 6, py + 6, 20, 20), Color(1, 0.2, 0.0) * intensity)  # Large = red
						
			elif map[y][x] == TileType.WALL:
				draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), Color(0.067, 0.067, 0.067))
	
	# Draw fuels that are visible
	for fuel in fuels:
		var dist = get_distance(fuel.pos.x, fuel.pos.y, player_pos.x, player_pos.y)
		if dist <= light_radius:
			var intensity = max(0.0, 1.0 - (dist / light_radius))
			var px = fuel.pos.x * TILE_SIZE
			var py = fuel.pos.y * TILE_SIZE
			
			match fuel.type:
				0:  # Small
					draw_rect(Rect2(px + 10, py + 10, 12, 12), Color(1, 0.6, 0.2) * intensity)
				1:  # Medium
					draw_rect(Rect2(px + 8, py + 8, 16, 16), Color(1, 0.4, 0.1) * intensity)
				2:  # Large
					draw_rect(Rect2(px + 6, py + 6, 20, 20), Color(1, 0.2, 0.0) * intensity)
	
	# Draw exit
	var exit_dist = get_distance(exit_pos.x, exit_pos.y, player_pos.x, player_pos.y)
	if exit_dist <= light_radius:
		var exit_intensity = max(0.0, 1.0 - (exit_dist / light_radius))
		draw_rect(Rect2(exit_pos.x * TILE_SIZE + 8, exit_pos.y * TILE_SIZE + 8, 16, 16), Color(0, 1, 0) * exit_intensity)
	
	# Draw enemy if visible and alive
	if enemy_alive:
		var enemy_dist = get_distance(enemy_pos.x, enemy_pos.y, player_pos.x, player_pos.y)
		if enemy_dist <= light_radius:
			var enemy_intensity = max(0.0, 1.0 - (enemy_dist / light_radius))
			
			# Enemy body color changes based on state
			var in_light = enemy_dist <= light_radius
			var torch_critical = torch <= CRITICAL_THRESHOLD
			
			var enemy_color: Color
			if in_light and not torch_critical:
				enemy_color = Color(0.5, 0.2, 0.2)  # Fleeing = darker
			else:
				enemy_color = Color(0.9, 0.1, 0.1)  # Hunting = bright red
			
			draw_circle(Vector2(enemy_pos.x * TILE_SIZE + TILE_SIZE/2, enemy_pos.y * TILE_SIZE + TILE_SIZE/2), 12, enemy_color * enemy_intensity)
			# Draw eyes
			draw_circle(Vector2(enemy_pos.x * TILE_SIZE + TILE_SIZE/2 - 3, enemy_pos.y * TILE_SIZE + TILE_SIZE/2 - 3), 3, Color(1, 1, 1) * enemy_intensity)
			draw_circle(Vector2(enemy_pos.x * TILE_SIZE + TILE_SIZE/2 + 3, enemy_pos.y * TILE_SIZE + TILE_SIZE/2 - 3), 3, Color(1, 1, 1) * enemy_intensity)
	
	# Draw player
	var player_px = player_pos.x * TILE_SIZE + TILE_SIZE / 2
	var player_py = player_pos.y * TILE_SIZE + TILE_SIZE / 2
	
	# Player body - color shifts based on torch level
	var player_color = Color(1, 0.67, 0.27)
	if torch <= CRITICAL_THRESHOLD:
		player_color = Color(1, 0.3, 0.1)  # Redder when critical
	
	draw_circle(Vector2(player_px, player_py), 12, player_color)
	
	# Draw darkness overlay
	for y in range(ROWS):
		for x in range(COLS):
			var px = x * TILE_SIZE
			var py = y * TILE_SIZE
			var dist = get_distance(x, y, player_pos.x, player_pos.y)
			
			if dist > light_radius * 0.5:
				var darkness = min(0.95, (dist - light_radius * 0.5) / (light_radius * 1.0))
				draw_rect(Rect2(px, py, TILE_SIZE, TILE_SIZE), Color(0, 0, 0, darkness))
