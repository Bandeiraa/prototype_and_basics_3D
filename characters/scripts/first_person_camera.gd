extends BaseCamera
class_name FirstPersonCamera

@export var _camera_height: float

func _initialize_camera() -> void:
	position.y = _camera_height
