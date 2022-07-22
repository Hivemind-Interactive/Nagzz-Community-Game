class_name Idle
extends BaseState


func _enter():
	._enter()


func _exit():
	._exit()


func _update(delta: float):
	._update(delta)
	_run_update(delta)


func _run_update(delta: float):
	var move_direction = _player.get_move_input_direction()

	# TODO do we need to change this to use acceleration instead?
	_player.velocity.x = _player.RUN_MAX_SPEED * move_direction

	_player.apply_gravity(delta)
	_player.move_player(delta)

	if not _player.is_on_floor() and _player.velocity.y > 0:
		_state_machine.transition_to(_state_machine.State.IN_AIR)
		return
