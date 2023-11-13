extends CanvasLayer
class_name TransitionScreen

var _scene_path: String

@export_category("Objects")
@export var _animation: AnimationPlayer

func fade_in(_target_scene: String) -> void:
	_scene_path = _target_scene
	_animation.play("fade_in")
	
	
func _on_animation_finished(_anim_name: String) -> void:
	match _anim_name:
		"fade_out":
			pass
			
		"fade_in":
			get_tree().change_scene_to_file(_scene_path)
			_animation.play("fade_out")
