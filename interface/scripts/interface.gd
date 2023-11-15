extends CanvasLayer
class_name Interface

@export_category("Objects")
@export var _cans: Label
@export var _money: Label
@export var _crosshair: Control

func _ready() -> void:
	game_data.interface = self
	
	
func update_coins(_amount: float) -> void:
	if _amount < 1.0:
		_money.text = "Money: " + str(_amount) + "¢"
		return
		
	_money.text = "Money: " + str(_amount) + "$"
	
	
func update_cans(_amount: float) -> void:
	_cans.text = "Cans: " + str(_amount)
	
	
func update_crosshair_visibility(_state: bool) -> void:
	_crosshair.visible = _state
