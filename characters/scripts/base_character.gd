extends CharacterBody3D
class_name BaseCharacter

var _current_speed: float

@export_category("Variables")
@export var _walk_speed: float = 2.0
@export var _run_speed: float = 3.5

@export_category("Objects")
@export var _body: CharacterBody
@export var _spring_arm_offset: CharacterArm

func _physics_process(_delta: float) -> void:
	_move()
	move_and_slide()
	_body.animate(velocity)
	
	
func _move() -> void:
	var _input_direction: Vector2 = (
		Input.get_vector(
			"move_left", "move_right", 
			"move_forward", "move_backward"
		)
	)
	
	var _direction: Vector3 = transform.basis * Vector3(
		_input_direction.x, 0, _input_direction.y
	).normalized()
	
	is_running()
	_direction = _direction.rotated(Vector3.UP, _spring_arm_offset.rotation.y)
	
	if _direction:
		velocity.x = _direction.x * _current_speed
		velocity.z = _direction.z * _current_speed
		_body.apply_rotation(velocity)
		return
		
	velocity.x = move_toward(velocity.x, 0, _current_speed)
	velocity.z = move_toward(velocity.z, 0, _current_speed)
	
	
func is_running() -> bool:
	if Input.is_action_pressed("shift"):
		_current_speed = _run_speed
		return true
		
	_current_speed = _walk_speed
	return false
