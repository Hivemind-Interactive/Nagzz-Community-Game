class_name InAir
extends BaseState


var _coyote_time_elapsed := 0.0


# BaseState interface implementation.

func _enter():
	._enter()
	print("Enter InAir state.")
	_coyote_time_elapsed = 0.0
	
	
func _exit():
	._exit()
	print("Exit InAir state.")
	
	
func _update(delta: float):
	._update(delta)

	if _player.is_on_floor():
		_state_machine.transition_to(_state_machine.State.ON_GROUND)

	_player.apply_air_friction(delta)
	_player.apply_gravity(delta)

	_coyote_time_elapsed += delta
	if (
			Input.is_action_just_pressed("jump") 
			and _coyote_time_elapsed <= _player.COYOTE_TIME_SECS
	):
		print("-------------------------\nCoyote time jump\n-------------------------")
		_state_machine.transition_to(_state_machine.State.JUMP)
		return

	_player.air_move(delta)
	_player.move_player(delta)

# BaseState interface end.
