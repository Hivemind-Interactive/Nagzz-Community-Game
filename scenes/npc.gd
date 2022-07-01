tool
extends Node2D

const Interactable := preload("res://scenes/interactable.gd")

export(Shape2D) var shape = RectangleShape2D setget set_shape

onready var _interactable := $"Interactable" as Interactable


func _ready():
	assert(shape != null)
	assert(_interactable != null)

	if shape != null:
		_interactable.shape = shape


func set_shape(new_shape: Shape2D):
	shape = new_shape
	if _interactable != null:
		_interactable.shape = new_shape


func _on_Interactable_interacted(player: Player):
	assert(player.has_signal("dialog_started"))
	player.emit_signal("dialog_started", true, 2)

