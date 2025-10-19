extends Node
class_name weapon
@export var base_damage: int
@export var damage_multiplier: float
@export var weapon_info: weapon_display

func equip():
	set_physics_process(true)
	
func unequip():
	set_physics_process(false)
func attack():
	pass
