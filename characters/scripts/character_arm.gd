extends Node3D
class_name CharacterArm

const _MOUSE_SENSIBILITY: float = 0.003

var can_rotate: bool = true

@export_category("Objects")
@export var _spring_arm: SpringArm3D = null

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	
func _unhandled_input(_event) -> void:
	if not can_rotate:
		return
		
	if _event is InputEventMouseMotion:
		rotate_y(-_event.relative.x * _MOUSE_SENSIBILITY)
		_spring_arm.rotate_x(-_event.relative.y * _MOUSE_SENSIBILITY)
		_spring_arm.rotation.x = clamp(
			_spring_arm.rotation.x, 
			deg_to_rad(-45), 
			deg_to_rad(15)
		)
