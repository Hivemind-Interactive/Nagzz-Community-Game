extends Area2D

onready var player_stats = HealthStats

func _on_HitBox_area_entered(area):
	player_stats.health -= area.damage
	
