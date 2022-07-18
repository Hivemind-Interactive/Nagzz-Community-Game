extends Control

func _ready():
	self.max_value = HealthStats.max_health
	self.value = HealthStats.health
	HealthStats.connect("max_health_changed", self, "set_max_health_bar")
	HealthStats.connect("health_changed", self, "set_health_bar")
	
func set_max_health_bar(value):
	self.max_value = HealthStats.max_health
	
func set_health_bar(value):
	self.value = HealthStats.health
	
