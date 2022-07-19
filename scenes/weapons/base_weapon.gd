class_name BaseWeapon
extends Node


var _player = null
var _weapon = null

# TODO will probably need to add an option for flat addition bonuses as well
# TODO make use of these
var damage_mult := 1.0
var accuracy_mult := 1.0
var reload_speed_mult := 1.0
var fire_rate_mult := 1.0
var mag_capacity_mult := 1.0


func _init(player):
	assert(player)
	_player = player as Player
	_weapon = _player.weapon


# BaseWeapon interface start.

func on_fire(_delta: float):
	push_error("Must be implemented by a child class")


func on_reload(_delta: float):
	push_error("Must be implemented by a child class")


func on_picked():
	pass


func physics_update(_delta: float):
	pass


func get_texture_path() -> String:
	push_error("Must be implemented by a child class")
	return ""

# BaseWeapon interface end.

