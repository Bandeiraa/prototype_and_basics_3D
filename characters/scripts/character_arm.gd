extends BaseCamera
class_name ThirdPersonCamera

@export var _camera_height: float = 2.0
@export var _spring_length: float = 3.0

func _initialize_camera() -> void:
	_offset.position.y = _camera_height
	_offset.spring_length = _spring_length
