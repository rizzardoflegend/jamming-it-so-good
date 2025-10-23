extends CharacterBody2D
@export var item: Resource
@export var item_identifier: int
func _ready() -> void:
	$Sprite2D.texture = item.weapon_sprite
	item_identifier = item.weapon_id


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is player:
		body.switch_weapon(item_identifier)
		queue_free()
