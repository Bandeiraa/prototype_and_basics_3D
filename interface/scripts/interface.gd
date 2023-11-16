extends CanvasLayer
class_name Interface

var _button_name: String

var _can_click: bool = true
var _can_interact: bool = false

@export_category("Objects")
@export var _cans: Label
@export var _money: Label
@export var _crosshair: Control
@export var _pause_container: Control
@export var _buttons_container: VBoxContainer

func _ready() -> void:
	game_data.interface = self
	for _button in _buttons_container.get_children():
		_button.mouse_exited.connect(_mouse_interaction.bind(_button, "exited"))
		_button.mouse_entered.connect(_mouse_interaction.bind(_button, "entered"))
		
		
func _mouse_interaction(_button, _state: String) -> void:
	match _state:
		"exited":
			_button.modulate.a = 1.0
			_can_interact = false
			
		"entered":
			_button_name = _button.name
			_button.modulate.a = 0.6
			_can_interact = true
			
			
func update_coins(_amount: float) -> void:
	if _amount < 1.0:
		_money.text = "Money: " + str(_amount) + "¢"
		return
		
	_money.text = "Money: " + str(_amount) + "$"
	
	
func update_cans(_amount: float) -> void:
	_cans.text = "Cans: " + str(_amount)
	
	
func update_crosshair_visibility(_state: bool) -> void:
	_crosshair.visible = _state
	
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and _can_interact and _can_click:
		match _button_name:
			"MainMenu":
				_can_click = false
				game_data.cans = 0
				game_data.money = 0
				transition_screen.fade_in("res://levels/initial_screen.tscn")
				
			"Resume":
				_toggle_pause()
				
			"Quit":
				get_tree().quit()
				
				
	if Input.is_action_just_pressed("esc"):
		_toggle_pause()
		
		
func _toggle_pause() -> void:
	get_tree().paused = not get_tree().paused
	_pause_container.visible = not _pause_container.visible
	
	if _pause_container.visible:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		return
		
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
