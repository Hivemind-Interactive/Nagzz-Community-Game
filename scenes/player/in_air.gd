class_name InAir
extends BaseState

# BaseState interface implementation.

func _enter():
	._enter()
	print("Enter InAir state.")
	
	
func _exit():
	._exit()
	print("Exit InAir state.")
	
	
func _update(delta: float):
	._update(delta)
	
	if _player.is_on_floor():
		_state_machine.transition_to(_state_machine.State.ON_GROUND)
	
	_player.apply_gravity(delta)
	_player.apply_velocity(delta)
	
	
# BaseState interface end.
