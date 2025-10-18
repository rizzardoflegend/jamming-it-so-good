extends state
@onready var player_node = $"../.."
@onready var animation_node = $"../../Icon"
var is_dashing: bool = false
var direction = Vector2.ZERO
var can_dash = true
func enter():
	set_physics_process(true)
	
func exit():
	set_physics_process(false)
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("dash") and can_dash:
		dash()
	if !is_dashing:
		direction = Input.get_vector("left", "right", "up", "down")
		player_node.velocity = direction * PlayerInfo.player_speed

func dash():
	is_dashing = true
	direction = Input.get_vector("left", "right", "up", "down")
	player_node.velocity = direction * PlayerInfo.player_dash_speed
	await get_tree().create_timer(PlayerInfo.player_dash_duration).timeout
	is_dashing = false
	can_dash = false
	await get_tree().create_timer(PlayerInfo.dash_cooldown).timeout
	can_dash = true
