extends Node3D
class_name CharacterBody

const _LERP_VELOCITY: float = 0.15

var _on_action: bool = false

@export_category("Objects")
@export var _character: BaseCharacter
@export var _animation: AnimationPlayer

func apply_rotation(_velocity: Vector3) -> void:
	rotation.y = lerp_angle(
		rotation.y, 
		atan2(-_velocity.x, -_velocity.z),
		_LERP_VELOCITY
	)
	
	
func animate(_velocity: Vector3) -> void:
	if _on_action:
		return
		
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
		
		
func animate_action(_action: String) -> void:
	_animation.play(_action)
	_on_action = true
	
	
func _on_animation_finished(_anim_name: String) -> void:
	match _anim_name:
		"Flip":
			_on_action = false
