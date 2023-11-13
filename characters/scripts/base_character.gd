extends CharacterBody3D
class_name BaseCharacter

signal reload_level

var offset: Node3D = null
var current_camera: BaseCamera = null

var _is_dead: bool = false
var _jump_count: int = 0
var _current_speed: float

@export_category("Flags")
@export var _can_run: bool = true
@export var _can_flip: bool = true
@export var _fall_limit: float = -7.5

@export_category("Variables")
@export var _gravity: float = 9.8
@export var _run_speed: float = 3.5
@export var _walk_speed: float = 2.0
@export var _jump_speed: float = 7.0

@export_category("Objects")
@export var _body: CharacterBody
@export var _tpc: ThirdPersonCamera
@export var _fpc: FirstPersonCamera

func _ready() -> void:
	_tpc.update_camera_state(false)
	_fpc.update_camera_state(true)
	current_camera = _fpc
	
	
func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y -= _gravity * _delta
		
	_jump()
	_move()
	_update_camera()
	move_and_slide()
	_body.animate(velocity)
	
	if not _is_dead and position.y < _fall_limit:
		emit_signal("reload_level")
		_is_dead = true
		
	if is_on_floor():
		_jump_count = 0
		
		
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
	_direction = _direction.rotated(Vector3.UP, offset.rotation.y)
	
	if _direction:
		velocity.x = _direction.x * _current_speed
		velocity.z = _direction.z * _current_speed
		_body.apply_rotation(velocity)
		return
		
	velocity.x = move_toward(velocity.x, 0, _current_speed)
	velocity.z = move_toward(velocity.z, 0, _current_speed)
	
	
func is_running() -> bool:
	if Input.is_action_pressed("shift") and _can_run:
		_current_speed = _run_speed
		return true
		
	_current_speed = _walk_speed
	return false
	
	
func _jump() -> void:
	if Input.is_action_just_pressed("ui_accept") and _can_flip:
		if _jump_count < 2:
			velocity.y = _jump_speed
			_jump_count += 1
			
			if _jump_count > 1:
				_body.animate_action("Flip")
				
		return
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = _jump_speed
		
		
func _update_camera() -> void:
	if Input.is_action_just_pressed("toggle_camera"):
		if current_camera == _fpc:
			_fpc.update_camera_state(false)
			_tpc.update_camera_state(true)
			current_camera = _tpc
			return
			
		if current_camera == _tpc:
			_tpc.update_camera_state(false)
			_fpc.update_camera_state(true)
			current_camera = _fpc
