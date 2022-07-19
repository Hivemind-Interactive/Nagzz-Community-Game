class_name Jump
extends BaseState


var _last_jump_pressed_elapsed_time := 0.0


func _enter():
	._enter()
	apply_jump_force()


func _exit():
	._exit()


func apply_jump_force():
	_last_jump_pressed_elapsed_time = 0.0
	var jump_force = _player.JUMP_FORCE * Vector2(_player.get_move_input_direction(), 1)
	_player.add_force(jump_force)


func _update(delta: float):
	._update(delta)
	
	if Input.is_action_just_released("jump") and _player.velocity.y <= -_player.JUMP_CUT_FORCE:
		_player.velocity.y += _player.JUMP_CUT_FORCE

	_last_jump_pressed_elapsed_time += delta
	if Input.is_action_just_pressed("jump"):
		_last_jump_pressed_elapsed_time = 0.0

	_player.apply_air_friction(delta)
	_player.air_move(delta)
	_player.apply_gravity(delta, 1.0 if _player.velocity.y < 0 else _player.JUMP_FALL_MULTIPLIER)
	_player.move_player(delta)

	# First check is needed because the first frame after entering the jump state
	# is_on_floor will still return true until the next move.
	if _player.velocity.y >= 0 and _player.is_on_floor():
		if _last_jump_pressed_elapsed_time <= _player.JUMP_BUFFER_TIME_SECS:
			apply_jump_force()
		else:
			_state_machine.transition_to(StateMachine.State.ON_GROUND)

