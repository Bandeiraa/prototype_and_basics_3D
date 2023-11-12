extends Node3D
class_name CharacterArm

const _MOUSE_SENSIBILITY: float = 0.003

var can_rotate: bool = true

@export_category("Objects")
@export var _spring_arm: SpringArm3D = null

@export_category("Variables")
@export var _camera_height: float = 2.0
@export var _spring_length: float = 3.0

@export var _y_min_rotation: float = 15
@export var _y_max_rotation: float = -45

func _ready() -> void:
	_spring_arm.position.y = _camera_height
	_spring_arm.spring_length = _spring_length
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	
func _unhandled_input(_event) -> void:
	if not can_rotate:
		return
		
	if _event is InputEventMouseMotion:
		rotate_y(-_event.relative.x * _MOUSE_SENSIBILITY)
		_spring_arm.rotate_x(-_event.relative.y * _MOUSE_SENSIBILITY)
		_spring_arm.rotation.x = clamp(
			_spring_arm.rotation.x, 
			deg_to_rad(_y_max_rotation), 
			deg_to_rad(_y_min_rotation)
		)
