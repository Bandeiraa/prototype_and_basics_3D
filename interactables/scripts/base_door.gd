extends Area3D
class_name BaseDoor

var _is_door_opened: bool = false
var _player_ref: BaseCharacter = null

@export_category("Objects")
@export var _animation: AnimationPlayer

func _on_body_entered(_body) -> void:
	if _body is BaseCharacter:
		_player_ref = _body
		
		
func _on_body_exited(_body) -> void:
	if _body is BaseCharacter:
		_player_ref = null
		
		
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and _player_ref != null and not _is_door_opened:
		_animation.play("open_door")
		_is_door_opened = true
