extends Node
@export var player_max_speed := 500
@export var player_max_dash_speed := 3000
@export var player_dash_duration := 0.07
@export var player_max_health := 100
var player_speed = 500
var player_cur_health_max: int
var player_cur_health: int
var player_dash_speed = 3000
var dash_cooldown := 0.1

#weapons

func reset_stats():
	player_speed = player_max_speed
	player_dash_speed = player_max_dash_speed
	player_cur_health_max = player_max_health
	player_cur_health = player_cur_health_max
