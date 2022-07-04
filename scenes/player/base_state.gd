class_name BaseState
extends Node

onready var _player := find_parent("Player") as Player
onready var _state_machine := find_parent("StateMachine") as StateMachine


func _ready():
	assert(_player is Player)
	assert(_state_machine is StateMachine)

# BaseState interface implementation.

func _enter(_delta: float):
	pass
	
func _exit(_delta: float):
	pass

func _update(_delta: float):
	pass

# BaseState interface end.



# Called by StateMachine.
func physics_process(delta: float):
	if (
			Input.is_action_just_pressed("jump") 
			and _player.can_jump() 
			and _state_machine.current_state != _state_machine.State.JUMP
	):
		_state_machine.transition_to(_state_machine.State.JUMP, delta)
		
	_update(delta)
