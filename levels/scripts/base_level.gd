extends Node3D
class_name BaseLevel

var _character: BaseCharacter = null

@export_category("Variables")
@export var _scene_path: String

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	_spawn_player()
	
	
func _spawn_player() -> void:
	_character = load(game_data.character_scene_path).instantiate()
	_character.reload_level.connect(_reload_level)
	add_child(_character)
	
	
func _reload_level() -> void:
	game_data.cans = 0
	game_data.money = 0
	transition_screen.fade_in(_scene_path)
