extends Node
class_name GameData

var money: float

var interface: Interface = null

func update_money(_amount: float) -> void:
	money += _amount
	interface.update_coins(money)
