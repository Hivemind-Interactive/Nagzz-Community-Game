extends Area2D

export var velocity: int = 500
var player_velocity: Vector2

func _physics_process(delta):
	global_position += (velocity * Vector2.RIGHT.rotated(rotation) + player_velocity) * delta

func destroy():
	queue_free()

func _on_projectile_area_entered(_area):
	destroy()


func _on_projectile_body_entered(_body):
	destroy()


func _on_VisibilityNotifier2D_screen_exited():
	print("-------------------------\nRemoved projectile\n-------------------------")
	queue_free()
