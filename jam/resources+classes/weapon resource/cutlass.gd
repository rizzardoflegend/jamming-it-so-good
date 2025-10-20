extends weapon
@onready var sword_hitbox = $hitbox
@onready var collision = $hitbox/CollisionShape2D
var can_attack = true
func _ready() -> void:
	collision.disabled = true
func _physics_process(delta: float) -> void:
	
	sword_hitbox.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("attack") and can_attack:
		attack()
		
func attack():
	can_attack = false
	collision.disabled = false
	#play animation here
	await get_tree().create_timer(0.2).timeout
	collision.disabled = true
	await get_tree().create_timer(0.5).timeout
	can_attack = true
	
