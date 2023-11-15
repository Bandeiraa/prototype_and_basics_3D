extends Node3D
class_name BaseLevel

@export_category("Variables")
@export var _scene_path: String

@export_category("Objects")
@export var _character: BaseCharacter

func _ready() -> void:
	_character.reload_level.connect(_reload_level)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	
func _reload_level() -> void:
	game_data.money = 0
	transition_screen.fade_in(_scene_path)
