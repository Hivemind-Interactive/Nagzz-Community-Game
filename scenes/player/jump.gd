class_name Jump
extends BaseState

# BaseState interface implementation.
# TODO implement according to https://www.youtube.com/watch?v=hG9SzQxaCm8
func _enter():
	._enter()
	print("Enter Jump state.")
	_player.add_force(Vector2(0, -_player.JUMP_FORCE))
	
	
func _exit():
	._exit()
	print("Exit Jump state.")
	
	
func _update(delta: float):
	._update(delta)
	if _player.is_on_floor():
		_state_machine.transition_to(StateMachine.State.ON_GROUND)
	_player.apply_gravity(delta)
	_player.apply_velocity(delta)
	
	
# BaseState interface end.
