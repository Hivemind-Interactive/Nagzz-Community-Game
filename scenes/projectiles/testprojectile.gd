class_name Projectile
extends Area2D

const SPEED := 1500.0

export var damage: int = 10

var _velocity: Vector2
var _initial_velocity: Vector2


# TODO make a projectile originate not from the center of a the player, but from the gun itself


func init(player: Player, angle: float):
	global_position = player.global_position
	_velocity = Vector2(SPEED, 0).rotated(angle)
	rotation = angle


func _physics_process(delta: float):
	global_position += _velocity * delta


func destroy():
	queue_free()


func _on_Projectile_area_entered(_area):
	destroy()


func _on_Projectile_body_entered(_body):
	destroy()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
