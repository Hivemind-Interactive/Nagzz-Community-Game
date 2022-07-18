extends Node

export(int) var max_health = 100 setget set_max_health
onready var health = max_health setget set_health

signal max_health_changed(new_max_health)
signal health_changed(new_health)
signal no_health

func _ready():
	_initialize()

func set_max_health(new_max_health):
	max_health = new_max_health
	max_health = max(1, new_max_health)
	emit_signal("max_health_changed", max_health)
	
func set_health(new_health):
	health = new_health
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health)
	print("hi")
	if health <= 0:
		emit_signal("no_health")
	
func _initialize():
	emit_signal("max_health_changed", max_health)
	emit_signal("health_changed", health)
	
