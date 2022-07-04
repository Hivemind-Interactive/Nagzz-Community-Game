class_name Idle
extends BaseState

# BaseState interface implementation.

func _enter(delta: float):
	._enter(delta)
	print("Enter OnGround state.")
	
func _exit(delta: float):
	._exit(delta)
	print("Exit OnGround state.")
	
func _update(delta: float):
	._update(delta)
	_run_update(delta)
	
# BaseState interface end.



func _run_update(delta: float):
	var move_direction = _player.get_move_input_direction()

	_player._velocity.x = _player.RUN_SPEED * move_direction
	
	_player.apply_gravity(delta)
	_player.apply_velocity(delta)
	
	if not _player.is_on_floor() and _player._velocity.y > 0:
		_state_machine.transition_to(_state_machine.State.IN_AIR, delta)
		return
