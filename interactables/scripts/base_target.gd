extends Area3D
class_name BaseTarget

@export_category("Variables")
@export var _available_target: bool = true
@export var _can_kill: bool = true
@export var _score: int

@export_category("Objects")
@export var _animation: AnimationPlayer

func _on_body_entered(_body) -> void:
	if _available_target:
		game_data.update_score(_score)
		_available_target = false
		
		if _animation:
			_animation.play("rotate")
			return
			
		if _can_kill:
			await get_tree().create_timer(0.1).timeout
			queue_free()
