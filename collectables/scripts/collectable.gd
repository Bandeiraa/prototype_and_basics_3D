extends Area3D
class_name Collectable

var _can_be_collected: bool = true

@export_category("Variables")
@export var _type: String
@export var _amount: float
@export var _can_rotate: bool = false

@export_category("Objects")
@export var _animation: AnimationPlayer

func _ready() -> void:
	if _type == "can":
		_amount = randi_range(1, 5)
		
	if _can_rotate:
		_animation.play("rotate")
		
		
func _on_collectable_body_entered(_body) -> void:
	if _body is BaseCharacter and _can_be_collected:
		match _type:
			"coin":
				game_data.update_money(_amount)
				
			"can":
				game_data.update_can(_amount)
				
		_can_be_collected = false
		_animation.play("kill")
		
		
func _on_animation_finished(_anim_name: String) -> void:
	queue_free()
