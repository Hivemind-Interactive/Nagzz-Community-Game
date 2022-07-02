extends Area2D

# every interactable has `interacted` signal
var _interactables: Array = []

onready var _player := find_parent("Player") as Player


func _process(_delta):
	if Input.is_action_just_pressed("interact") and _player.can_player_interact:
		_interact()


func _interact() -> void:
	print("interaction started")

	var closest = _get_closest_interactable()
	
	if closest != null:
		closest.emit_signal("interacted", _player)


func _get_closest_interactable() -> Area2D:
	if _interactables.size() == 0:
		return null

	if _interactables.size() == 1:
		return _interactables[0]

	var closest: Area2D = _interactables[0]
	var closest_distance := closest.global_position.distance_to(
		self.global_position
	)

	for i in range(1, _interactables.size()):
		var distance = _interactables[i].global_position.distance_to(
			self.global_position
		)

		# if distance is the same, first has prority
		if distance < closest_distance:
			closest = _interactables[i]
			closest_distance = distance
		
	return closest


func _on_InteractionBox_area_entered(area: Area2D):
	if area.has_signal("interacted"):
		_interactables.push_back(area)


func _on_InteractionBox_area_exited(area: Area2D):
	for i in range(_interactables.size()):
		var interactable: Area2D = _interactables[i]
		if interactable.get_instance_id() == area.get_instance_id():
			_interactables.remove(i)
			return
