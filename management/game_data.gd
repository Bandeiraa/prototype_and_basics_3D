extends Node
class_name GameData

var cans: float
var money: float

var interface: Interface = null

func update_money(_amount: float) -> void:
	money += _amount
	interface.update_coins(money)
	
	
func update_can(_amount: float) -> void:
	cans += _amount
	interface.update_cans(cans)
