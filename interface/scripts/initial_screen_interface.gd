extends CanvasLayer
class_name InitialScreenInterface

var _button_in_range: String
var _can_interact: bool = false

@export_category("Objects")
@export var _character_name: Label
@export var _character_stats: VBoxContainer
@export var _how_to_play_container: ColorRect

func _ready() -> void:
	get_tree().paused = false
	_display_character_data("")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	for _button in get_tree().get_nodes_in_group("button"):
		_button.mouse_exited.connect(_mouse_interaction.bind(_button, "exited"))
		_button.mouse_entered.connect(_mouse_interaction.bind(_button, "entered"))
		
		
func _mouse_interaction(_button, _state: String) -> void:
	match _state:
		"exited":
			_button_in_range = ""
			_can_interact = false
			_button.modulate.a = 1.0
			if _button.name == "Sophia" or _button.name == "Gobot":
				_display_character_data("")
				_character_name.text = ""
				
		"entered":
			_can_interact = true
			_button_in_range = _button.name
			_button.modulate.a = .6
			if _button.name == "Sophia" or _button.name == "Gobot":
				_display_character_data(_button.name)
				_character_name.text = _button.name
				
				
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("esc") and _how_to_play_container.visible:
		_how_to_play_container.hide()
		
	if _can_interact and Input.is_action_just_pressed("left_click"):
		match _button_in_range:
			"Quit":
				get_tree().quit()
				
			"HowToPlay":
				_how_to_play_container.show()
				
		if _button_in_range == "Sophia" or _button_in_range == "Gobot":
			game_data.character_scene_path = game_data.characters_data[_button_in_range]["scene_path"]
			transition_screen.fade_in("res://levels/prototype_level_1.tscn")
			
			
func _display_character_data(_character: String) -> void:
	var _index: int = 0
	
	var _data: Dictionary = game_data.characters_data[_character]
	var _keys: Array = _data.keys()
	
	for _stat in _character_stats.get_children():
		if _character == "":
			_stat.text = ""
			continue
			
		_stat.text = _keys[_index] + ": " + _data[_keys[_index]]
		_index += 1
