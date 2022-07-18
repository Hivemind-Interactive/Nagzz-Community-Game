class_name Player
extends KinematicBody2D

# Consts
const GRAVITY := 1500.0
const JUMP_FORCE := Vector2(50, -750)
const AIR_FRICTION := 185.0
const AIR_MOVE_ACCELERATION := 625.0
# So that the player falls faster than accelerates upwards.
const JUMP_FALL_MULTIPLIER: float = 1.3
# Jump buffer time, in seconds.
const JUMP_BUFFER_TIME_SECS := 0.12 # Rougly 7 frames at 60 FPS.
# Coyote time https://developer.amazon.com/blogs/appstore/post/9d2094ed-53cb-4a3a-a5cf-c7f34bca6cd3/coding-imprecise-controls-to-make-them-feel-more-precise
const COYOTE_TIME_SECS := 0.1

const RUN_MAX_SPEED: float = 300.0

enum MOVE_DIRECTION {
	LEFT = -1,
	NONE = 0,
	RIGHT = 1
}
# Consts end


export var can_player_jump := true
export var can_player_interact := true

onready var _state_machine = $StateMachine

var _velocity := Vector2.ZERO
<<<<<<< Updated upstream
var health_stats = PlayerHp
=======

var last_attack_time := 1.0
>>>>>>> Stashed changes


func _ready():
	print("Player node created")
	assert(_state_machine != null)


func _physics_process(delta: float):
	_state_machine.update(delta)
	$StatusLabelDebug.text = "%s\n x: %3.2f  y: %3.2f" % [
			_state_machine.State.keys()[_state_machine.current_state],
			_velocity.x,
			_velocity.y
	]


func move_player(_delta: float):
	$VelocityDirectionDebugArrow.look_at(get_global_position() + _velocity)
	_velocity = self.move_and_slide(_velocity, Vector2.UP)


func apply_gravity(delta: float, gravity_mult: float = 1.0):
	_velocity.y += GRAVITY * gravity_mult * delta


func add_force(force: Vector2):
	_velocity += force


func air_move(delta: float):
	var move_direction = get_move_input_direction()
	_velocity.x += AIR_MOVE_ACCELERATION * move_direction * delta
	_velocity.x = sign(_velocity.x) * min(RUN_MAX_SPEED, abs(_velocity.x))


func apply_air_friction(delta: float):
	var movement_direction = sign(_velocity.x)
	_velocity.x = abs(_velocity.x) - AIR_FRICTION*delta
	_velocity.x = max(_velocity.x, 0)
	_velocity.x *= movement_direction


func can_jump() -> bool:
	return self.is_on_floor() and can_player_jump


func can_interact() -> bool:
	return can_player_interact


func get_move_input_direction() -> int:
	var move_direction := 0
	if Input.is_action_pressed("move_right"):
		move_direction += MOVE_DIRECTION.RIGHT
	if Input.is_action_pressed("move_left"):
		move_direction += MOVE_DIRECTION.LEFT
	return move_direction


<<<<<<< Updated upstream
func _on_Area2D_area_entered(area):
	health_stats.health -= area.damage
=======




>>>>>>> Stashed changes

