extends CharacterBody2D
@export var item: Resource
@export var item_identifier: int
func _ready() -> void:
	if "identifier" in item:
		if item.identfier == 1:
			$Sprite2D.texture = item.weapon_sprite
			item_identifier = item.weapon_id
			
