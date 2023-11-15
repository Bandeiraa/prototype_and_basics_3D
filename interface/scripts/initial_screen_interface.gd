extends CanvasLayer
class_name InitialScreenInterface

@export_category("Objects")
@export var _character_name: Label

func _ready() -> void:
	for _area in get_tree().get_nodes_in_group("character_area"):
		_area.mouse_exited.connect(_mouse_interaction.bind(_area, "exited"))
		_area.mouse_entered.connect(_mouse_interaction.bind(_area, "entered"))
		
		
func _mouse_interaction(_area: TextureRect, _state: String) -> void:
	match _state:
		"exited":
			_area.modulate.a = .8
			_character_name.text = ""
			
		"entered":
			_area.modulate.a = .5
			_character_name.text = _area.name
