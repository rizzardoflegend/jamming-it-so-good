extends CharacterBody2D

@export var speed: float = 300.0
@export var dash_speed: float = 900.0
@export var dash_duration: float = 0.15
@export var dash_cooldown: float = 0.6

var is_dashing: bool = false
var direction = Vector2.ZERO
var can_dash = true


func _ready() -> void:
	$state_machine/controllable.enter()
	#$weapon_manager.switch_weapon(1)

func _physics_process(delta: float) -> void:
	move_and_slide()

func take_damage(damage_object: damage_class):
	if PlayerInfo.player_cur_health > 0:
		PlayerInfo.player_cur_health -= damage_object.damage
		
