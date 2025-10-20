extends CharacterBody2D

@export var speed: float = 100.0
@export var wander_radius: float = 200.0
@export var chase_distance: float = 250.0

@export var player: CharacterBody2D
var target_pos: Vector2
var wander_timer: float = 0.0

func _ready() -> void:
	randomize()
	player = get_tree().get_first_node_in_group("Player")
	_pick_new_wander_pos_shit()

func _physics_process(delta: float) -> void:
	if not player:
		player = get_tree().get_first_node_in_group("Player")
		return

	var dist_to_player = global_position.distance_to(player.global_position)

	if dist_to_player < chase_distance:
		_chase_shit()
	else:
		_wander_shit(delta)

	move_and_slide()

func _wander_shit(delta: float) -> void:
	wander_timer -= delta
	if wander_timer <= 0:
		_pick_new_wander_pos_shit()

	var dir = (target_pos - global_position)
	if dir.length() > 1:
		dir = dir.normalized()
		velocity = dir * speed * 0.6
	else:
		velocity = Vector2.ZERO
		_pick_new_wander_pos_shit()

func _chase_shit() -> void:
	var dir = (player.global_position - global_position)
	if dir.length() > 1:
		velocity = dir.normalized() * speed
	else:
		velocity = Vector2.ZERO

func _pick_new_wander_pos_shit() -> void:
	var offset = Vector2(
		randf_range(-wander_radius, wander_radius),
		randf_range(-wander_radius, wander_radius)
	)
	target_pos = global_position + offset
	wander_timer = randf_range(1.5, 3.0)
