extends Area2D
class_name hitbox
@export var damage: int
@export var stun_duration: float


func _on_area_entered(area: Area2D) -> void:
	if area is hurtbox:
		var new_damage_obj = damage_class.new()
		new_damage_obj.damage = damage
		new_damage_obj.stun_duration = stun_duration
		area.take_damage(new_damage_obj)
