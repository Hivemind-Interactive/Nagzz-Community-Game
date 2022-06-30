class_name Idle
extends BaseState

# BaseState interface implementation.

func _enter() -> void:
	._enter()
	print("Enter Idle state.")
	
func _exit() -> void:
	._exit()
	print("Exit Idle state.")
	
func _update(delta: float) -> void:
	._update(delta)
	_player.apply_gravity(delta)
	_player.apply_velocity(delta)
	
	
# BaseState interface end.
