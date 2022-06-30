class_name StateMachine
extends Node

enum State {
	IDLE,
	RUN,
	JUMP,
	IN_AIR
}

var current_state: int = State.IDLE

onready var _states: Dictionary = {
	(State.IDLE): $BaseState/Idle,
	#(State.RUN): $Run,
	(State.JUMP): $BaseState/Jump,
	#(State.IN_AIR): $In_air,
}

onready var _player := self.get_parent() as Player

func _ready() -> void:
	assert(_player != null)
	for state in _states.values():
		assert(state != null)
	
	print("Created _player state machine")
	get_current_state()._enter()

func get_current_state():
	return _states[current_state]


func update(delta: float) -> void:
	_states[current_state].physics_process(delta)


func transition_to(state: int) -> void:
	get_current_state()._exit()
	current_state = state
	get_current_state()._enter()
	
