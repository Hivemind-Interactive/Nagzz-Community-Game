tool
extends Node2D

const Interactable := preload("res://scenes/interactable/interactable.gd")

export(Shape2D) var shape = RectangleShape2D setget set_shape
export(PackedScene) var scene_to_load

onready var _interactable := $"Interactable" as Interactable


func _ready():
	assert(shape != null)
	assert(_interactable != null)

	_interactable.shape = shape


func set_shape(new_shape: Shape2D):
	shape = new_shape
	if _interactable != null:
		_interactable.shape = new_shape


func _on_Interactable_interacted(_player: Player):
	if scene_to_load != null:
		var res = get_tree().change_scene_to(scene_to_load)
		assert(res == OK)
