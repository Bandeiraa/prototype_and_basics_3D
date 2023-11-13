extends Node3D
class_name BaseLevel

@export_category("Variables")
@export var _scene_path: String

@export_category("Objects")
@export var _character: BaseCharacter

func _ready() -> void:
	_character.scene_path = _scene_path
