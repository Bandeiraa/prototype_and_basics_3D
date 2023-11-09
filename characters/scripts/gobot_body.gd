extends CharacterBody
class_name GobotBody

func animate_action(_action: String) -> void:
	_animation.play(_action)
	_on_action = true
	
	
func _on_animation_finished(_anim_name: String) -> void:
	match _anim_name:
		"Flip":
			_on_action = false
