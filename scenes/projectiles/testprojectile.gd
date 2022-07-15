class_name Projectile
extends Area2D

export var velocity: int = 500
var player_velocity: Vector2


# initial position and velocity, resets cooldown
func init(initial_velocity, player_position, angle) -> float:
	global_position = player_position
	player_velocity = initial_velocity
	rotation = angle
	return 0.0


func _physics_process(delta):
	global_position += (velocity * Vector2.RIGHT.rotated(rotation) + player_velocity) * delta


func destroy():
	queue_free()


func _on_Projectile_area_entered(_area):
	destroy()


func _on_Projectile_body_entered(_body):
	destroy()


func _on_VisibilityNotifier2D_screen_exited():
	print("-------------------------\nRemoved projectile\n-------------------------")
	queue_free()
