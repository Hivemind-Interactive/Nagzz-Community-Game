extends StaticBody2D

export var max_health: int = 100
export var health: int = max_health


func _ready():
	assert(max_health > 0)
	assert(health >= 0)
	assert(max_health >= health)


func _on_HitBox_area_entered(area: Area2D):
	if area is Projectile:
		var projectile = area as Projectile

		health -= projectile.damage
		print("enemy received %d damage, health: %d" % [projectile.damage, health])

		if health <= 0:
			queue_free()
