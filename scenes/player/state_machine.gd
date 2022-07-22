class_name StateMachine
extends Node

enum State {
	ON_GROUND,
	JUMP,
	IN_AIR,
}

var current_state: int = State.ON_GROUND

onready var _states: Dictionary = {
	State.ON_GROUND: $BaseState/OnGround,
	State.JUMP: $BaseState/Jump,
	State.IN_AIR: $BaseState/InAir,
}

onready var _player := self.get_parent() as Player


func _ready():
	assert(_player != null)
	for state in _states.values():
		assert(state != null)

	get_current_state()._enter()


func get_current_state():
	return _states[current_state]


func update(delta: float):
	_states[current_state].physics_process(delta)


func transition_to(state: int):
	get_current_state()._exit()
	current_state = state
	get_current_state()._enter()
