extends Node
class_name GameData

var cans: float
var money: float

var interface: Interface = null
var character_scene_path: String

var characters_data: Dictionary = {
	"Sophia": {
		"Arm Strength": "20.0",
		"Sprint Speed": "---",
		"Walk Speed": "5.25",
		"Jump Force": "11.3\n\n",
		"Double Jump": "No",
		
		"scene_path": "res://characters/scenes/sophia.tscn"
	},
	
	"Gobot": {
		"Arm Strength": "30.0",
		"Sprint Speed": "4.5",
		"Walk Speed": "3.25",
		"Jump Force": "7.0\n\n",
		"Double Jump": "Yes",
		
		"scene_path": "res://characters/scenes/gobot.tscn"
	},
	
	"": {}
}

func update_money(_amount: float) -> void:
	money += _amount
	interface.update_coins(money)
	
	
func update_can(_amount: float) -> void:
	cans += _amount
	interface.update_cans(cans)
