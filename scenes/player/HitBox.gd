extends Area2D


func _on_HitBox_area_entered(area):
	HealthStats.health -= area.damage
	

