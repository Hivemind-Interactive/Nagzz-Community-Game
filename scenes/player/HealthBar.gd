extends ProgressBar


func _ready():
	max_value = HealthStats.max_health
	value = HealthStats.health
	HealthStats.connect("max_health_changed", self, "set_max_health_bar")
	HealthStats.connect("health_changed", self, "set_health_bar")


func set_max_health_bar(value):
	self.max_value = value


func set_health_bar(value):
	self.value = value
	
