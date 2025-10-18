extends Area2D
class_name hurtbox
@export var daddy: CharacterBody2D

func take_damage(damage_object: damage_class):
	if daddy.has_method("take_damage"):
		daddy.take_damage(damage_object)
	else: 
		print("retard")
