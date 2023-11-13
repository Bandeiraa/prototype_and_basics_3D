extends Node3D
class_name BaseCamera

const _MOUSE_SENSIBILITY: float = 0.003

@export_category("Variables")
@export var _y_min_rotation: float = 15
@export var _y_max_rotation: float = -45

@export_category("Objects")
@export var _offset: Node3D = null
@export var _camera: Camera3D = null
@export var _character: BaseCharacter

func _ready() -> void:
	_initialize_camera()
	
	
func _initialize_camera() -> void:
	pass
	
	
func _unhandled_input(_event) -> void:
	if _event is InputEventMouseMotion:
		rotate_y(-_event.relative.x * _MOUSE_SENSIBILITY)
		_offset.rotate_x(-_event.relative.y * _MOUSE_SENSIBILITY)
		_offset.rotation.x = clamp(
			_offset.rotation.x, 
			deg_to_rad(_y_max_rotation), 
			deg_to_rad(_y_min_rotation)
		)
		
		
func update_camera_state(_state: bool) -> void:
	if _state:
		_camera.current = true
		_character.offset = self
