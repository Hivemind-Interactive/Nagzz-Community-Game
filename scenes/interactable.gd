tool
extends Area2D

#warning-ignore:unused_signal
signal interacted(player)  # player: Player

export(Shape2D) var shape = RectangleShape2D setget set_shape

onready var _coll_shape_2d := $"CollisionShape2D" as CollisionShape2D


func _ready():
	assert(shape != null)
	assert(_coll_shape_2d != null)

	_coll_shape_2d.shape = shape


func set_shape(new_shape):
	shape = new_shape
	if _coll_shape_2d != null:
		_coll_shape_2d.shape = new_shape
