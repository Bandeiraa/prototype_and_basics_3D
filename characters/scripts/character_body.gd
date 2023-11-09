extends Node3D
class_name CharacterBody

const _LERP_VELOCITY: float = 0.15

@export_category("Objects")
@export var _character: BaseCharacter
@export var _animation: AnimationPlayer

func apply_rotation(_velocity: Vector3) -> void:
	rotation.y = lerp_angle(
		rotation.y, 
		atan2(-_velocity.x, -_velocity.z),
		_LERP_VELOCITY
	)
	
	
var _on_action: bool = false

func animate(_velocity: Vector3) -> void:
	if _on_action:
		return
		
	_regular_animations(_velocity)
	
	
func _regular_animations(_velocity: Vector3) -> void:
	if _velocity.y != 0:
		_vertical_animations(_velocity)
		return
		
	if _velocity.x != 0:
		_horizontal_animations(_velocity)
		return
		
	_animation.play("Idle")
	
	
func _horizontal_animations(_velocity: Vector3) -> void:
	if _character.is_running():
		_animation.play("Run")
		return
		
	_animation.play("Walk")
	
	
func _vertical_animations(_velocity: Vector3) -> void:
	if _velocity.y > 0:
		_animation.play("Jump")
		
	if _velocity.y < 0:
		_animation.play("Fall")
