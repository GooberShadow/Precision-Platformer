extends "state.gd"

@export var climb_speed = 100
@export var slide_friction = .7


func update(delta):
	slide_movement(delta)
	if Player.get_next_to_wall() == null:
		return STATES.FALL
	if Player.jump_input_actuation:
		return STATES.JUMP
	if Player.is_on_floor():
		return STATES.IDLE
	return null

func slide_movement(delta):
	pass
	if Player.climb_input:
		if Player.movement_input.y < 0:
			Player.velocity.y = -climb_speed
		elif Player.movement_input.y > 0:
			Player.velocity.y = climb_speed
		else:
			Player.velocity.y = 0
	else:
			Player.gravity(delta)
			player_movement()
			Player.velocity.y *= slide_friction
			
