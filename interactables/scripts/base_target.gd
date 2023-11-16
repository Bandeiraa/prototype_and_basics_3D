extends Area3D
class_name BaseTarget

@export_category("Variables")
@export var _available_target: bool = true
@export var _score: int

func _on_body_entered(_body) -> void:
	if _available_target:
		game_data.update_score(_score)
		_available_target = false
