extends Node2D
class_name weapon_manager
@export var current_weapon: weapon

func _process(delta: float) -> void:
	if current_weapon:
		current_weapon.active = true

func upgrade():
	pass

func switch_weapon(weapon_id: int):
	
	if weapon_id == 1:
		current_weapon.active = false
		current_weapon = $cutlass
	if weapon_id == 2:
		current_weapon.active = false
		current_weapon = $dagger
