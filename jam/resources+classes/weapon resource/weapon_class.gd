extends Node2D
class_name weapon
@export var base_damage: int
@export var damage_multiplier: float
@export var weapon_info: weapon_display
@export var active = false
@export var weapon_id: int
func _process(delta: float) -> void:
	if active:
		set_physics_process(true)
	else: 
		set_physics_process(false)
func attack():
	pass
