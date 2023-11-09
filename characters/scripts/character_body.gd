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
	
	
func animate(_velocity: Vector3) -> void:
	if _velocity:
		if _character.is_running():
			_animation.play("Run")
			return
			
		_animation.play("Walk")
		return
		
	_animation.play("Idle")
