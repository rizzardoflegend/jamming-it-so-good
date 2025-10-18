extends CharacterBody2D

@export var speed: float = 300.0
@export var dash_speed: float = 900.0
@export var dash_duration: float = 0.15
@export var dash_cooldown: float = 0.6
@onready var dash_cooldown_timer = $dash_cooldown
var is_dashing: bool = false
var direction = Vector2.ZERO
var can_dash = true

func _ready() -> void:
	dash_cooldown_timer.wait_time = PlayerInfo.player_dash_duration
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("dash") and can_dash:
		dash()
	if !is_dashing:
		direction = Input.get_vector("left", "right", "up", "down")
		velocity = direction * PlayerInfo.player_speed
	
	move_and_slide()
func dash():
	is_dashing = true
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * PlayerInfo.player_dash_speed
	await get_tree().create_timer(PlayerInfo.player_dash_duration).timeout
	is_dashing = false
	can_dash = false
	await get_tree().create_timer(PlayerInfo.dash_cooldown).timeout
	can_dash = true
