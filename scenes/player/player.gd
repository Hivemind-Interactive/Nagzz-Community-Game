class_name Player
extends KinematicBody2D

# Consts
#TODO move to a separate file.
const GRAVITY: float = 1500.0
const JUMP_FORCE: float = 800.0
const RUN_SPEED: float = 275.0

enum MOVE_DIRECTION {
	LEFT = -1,
	NONE = 0
	RIGHT = 1
}
# Consts end

export var can_player_jump := true
export var can_player_interact := true

onready var _state_machine = $StateMachine

var _velocity: Vector2 = Vector2.ZERO


func _ready():
	print("Player node created")
	assert(_state_machine != null)


func _physics_process(delta: float):
	_state_machine.update(delta)
	$StatusLabelDebug.text = "%s\n x: %3.2f  y: %3.2f" % [_state_machine.State.keys()[_state_machine.current_state], _velocity.x, _velocity.y]


func apply_velocity(_delta: float):
	$VelocityDirectionDebugArrow.look_at(get_global_position() + _velocity)
	_velocity = self.move_and_slide(_velocity, Vector2.UP)


func apply_gravity(delta: float, gravity_mult: float = 1.0):
	_velocity.y += GRAVITY * gravity_mult * delta


func add_force(force: Vector2):
	_velocity += force


func can_jump() -> bool:
	return self.is_on_floor() and can_player_jump


func can_interact() -> bool:
	return can_player_interact

func get_move_input_direction() -> int:
	var move_direction := 0
	if Input.is_action_pressed("ui_right"):
		move_direction += MOVE_DIRECTION.RIGHT
	if Input.is_action_pressed("ui_left"):
		move_direction += MOVE_DIRECTION.LEFT
	return move_direction
