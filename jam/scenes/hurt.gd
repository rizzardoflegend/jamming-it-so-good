extends Area2D
@onready var player: CharacterBody2D = $"../../player"

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	randomize()
	_set_new_wander_target()
	if has_node("hurtbox"):
		$hurtbox.daddy = self
