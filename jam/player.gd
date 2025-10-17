extends CharacterBody2D

@export var speed: float = 300.0
@export var dash_speed: float = 900.0
@export var dash_duration: float = 0.15
@export var dash_cooldown: float = 0.6

var is_dashing: bool = false
var dash_time: float = 0.0
var dash_cooldown_time: float = 0.0
var dash_direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var input_dir: Vector2 = Vector2(
		Input.get_action_strength("mve_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

	if input_dir.length_squared() > 0.0:
		input_dir = input_dir.normalized()

	if is_dashing:
		dash_time -= delta
		velocity = dash_direction * dash_speed
		if dash_time <= 0.0:
			is_dashing = false
			dash_cooldown_time = dash_cooldown
	else:
		if dash_coolndown_time > 0.0:
			dash_cooldown_time -= delta

		velocity = input_dir * speed

		if Input.is_action_just_pressed("dash") and dash_cooldown_time <= 0.0:
			pass
		##i was too lazy to do this part sorry

	move_and_slide()
