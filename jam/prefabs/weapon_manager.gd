extends Node2D
class_name weapon_manager
@export var current_weapon: weapon

func _process(delta: float) -> void:
	if current_weapon:
		current_weapon.active = true
func attack():
	pass

func upgrade():
	pass

func switch_weapon(weapon_id: int):
	for i in get_children():
		if i.weapon_id == weapon_id:
			current_weapon = i
