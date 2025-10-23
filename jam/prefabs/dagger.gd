extends weapon
@onready var dagger_hitbox = $hitbox/CollisionShape2D
var can_attack = true
@export var attack_time: float

func _ready() -> void:
	dagger_hitbox.disabled = true

func _physics_process(delta: float) -> void:
	$hitbox.look_at(get_global_mouse_position())
	if can_attack and Input.is_action_just_pressed("attack"):
		attack()
	

func attack():
	dagger_hitbox.disabled = false
	#animations here
	await get_tree().create_timer(attack_time).timeout
	dagger_hitbox.disabled = true
