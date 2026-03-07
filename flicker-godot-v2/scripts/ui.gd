extends CanvasLayer

@onready var torch_bar = $Control/TorchBar/TorchFill
@onready var fuel_label = $Control/FuelLabel
@onready var level_label = $Control/LevelLabel
@onready var time_label = $Control/TimeLabel
@onready var game_over_screen = $GameOverScreen
@onready var level_complete_screen = $LevelCompleteScreen
@onready var victory_screen = $VictoryScreen
@onready var upgrade_screen = $UpgradeScreen
@onready var floating_text_container = $FloatingTextContainer

var start_time: int = 0

func _ready():
    start_time = Time.get_ticks_msec()

func reset_timer():
    start_time = Time.get_ticks_msec()

func _process(delta):
    var elapsed = (Time.get_ticks_msec() - start_time) / 1000
    var minutes = elapsed / 60
    var seconds = elapsed % 60
    time_label.text = "Time: %d:%02d" % [minutes, seconds]

func update_torch(current: float, maximum: float, is_critical: bool = false):
    var percent = (current / maximum) * 100
    torch_bar.size.x = 150 * (percent / 100)
    
    if is_critical or percent < 20:
        torch_bar.modulate = Color(1, 0, 0)
    elif percent < 50:
        torch_bar.modulate = Color(1, 0.5, 0)
    else:
        torch_bar.modulate = Color(1, 0.67, 0.27)

func update_fuel(count: int):
    fuel_label.text = "FUEL: %d" % count

func update_level(level: int):
    level_label.text = "DEPTH: %d" % level

func show_game_over():
    game_over_screen.visible = true

func show_level_complete():
    level_complete_screen.visible = true

func show_victory(total_fuel: int):
    var elapsed = (Time.get_ticks_msec() - start_time) / 1000
    var minutes = elapsed / 60
    var seconds = elapsed % 60
    
    var stats_label = victory_screen.get_node("StatsLabel")
    stats_label.text = "Time: %d:%02d | Fuel: %d" % [minutes, seconds, total_fuel]
    victory_screen.visible = true

func show_upgrade_screen():
    upgrade_screen.visible = true

func hide_all_screens():
    game_over_screen.visible = false
    level_complete_screen.visible = false
    victory_screen.visible = false
    upgrade_screen.visible = false

func show_floating_text(text: String, x: float, y: float):
    var label = Label.new()
    label.text = text
    label.modulate = Color(1, 0.67, 0.27)
    label.position = Vector2(x, y)
    label.add_theme_font_size_override("font_size", 14)
    floating_text_container.add_child(label)
    
    var tween = create_tween()
    tween.tween_property(label, "position:y", y - 30, 1.0)
    tween.parallel().tween_property(label, "modulate:a", 0, 1.0)
    tween.tween_callback(label.queue_free)

func show_attack_effect(x: float, y: float):
    var effect = Label.new()
    var flames = ["🔥", "✨", "⚡"]
    effect.text = flames[randi() % flames.size()]
    effect.position = Vector2(x, y)
    effect.add_theme_font_size_override("font_size", 20)
    floating_text_container.add_child(effect)
    
    var tween = create_tween()
    tween.tween_property(effect, "scale", Vector2(1.5, 1.5), 0.15)
    tween.tween_property(effect, "scale", Vector2(0.5, 0.5), 0.15)
    tween.parallel().tween_property(effect, "modulate:a", 0, 0.3)
    tween.tween_callback(effect.queue_free)

func _on_restart_button_pressed():
    get_tree().reload_current_scene()

func _on_next_level_button_pressed():
    var game = get_parent()
    game.next_level()

func _on_speed_upgrade_pressed():
    var game = get_parent()
    game.select_upgrade("speed")

func _on_efficiency_upgrade_pressed():
    var game = get_parent()
    game.select_upgrade("efficiency")

func _on_bright_upgrade_pressed():
    var game = get_parent()
    game.select_upgrade("bright")
