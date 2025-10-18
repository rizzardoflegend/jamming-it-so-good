extends state
func enterstun(stun_duration: float):
	#animations here
	await get_tree().create_timer(stun_duration).timeout
	$"../controllable".enter()
	exit()
func exit():
	#animations here
	pass
