class_name Player
extends KinematicBody2D

# Consts
#TODO move to a separate file.
const GRAVITY: float = 1500.0
const JUMP_FORCE: float = 800.0
# Consts end

export var can_player_jump := true
export var can_player_interact := true

onready var _state_machine = $StateMachine

var _velocity: Vector2 = Vector2.ZERO


func _ready() -> void:
	print("Player node created")
	assert(_state_machine != null)


func _physics_process(delta: float) -> void:
	_state_machine.update(delta)


func apply_velocity(_delta: float):
	_velocity = self.move_and_slide(_velocity, Vector2.UP)


func apply_gravity(delta: float, gravity_mult: float = 1.0) -> void:
	_velocity.y += GRAVITY * gravity_mult * delta


func add_force(force: Vector2) -> void:
	_velocity += force


func can_jump() -> bool:
	return self.is_on_floor() and can_player_jump


func can_interact() -> bool:
	return can_player_interact
