extends CanvasLayer
class_name Interface

@export_category("Objects")
@export var _coins: Label

func _ready() -> void:
	game_data.interface = self
	
	
func update_coins(_amount: float) -> void:
	if _amount < 1.0:
		_coins.text = "Coins: " + str(_amount) + "¢"
		return
		
	_coins.text = "Coins: " + str(_amount) + "$"
