extends Control

onready var max_health_bar = 100 setget set_max_health_bar
onready var health_bar = 100 setget set_health_bar

func _ready():
	self.max_health_bar = max_health_bar
	self.health_bar = max_health_bar
	PlayerHp.connect("max_health_changed", self, "set_max_health_bar")
	PlayerHp.connect("health_changed", self, "set_health_bar")
	
	
func set_max_health_bar(value):
	self.value = PlayerHp.max_health
	max_health_bar = max(value, 1)
	
func set_health_bar(value):
	self.value = PlayerHp.health
	health_bar = clamp(value, 0, max_health_bar)
	
