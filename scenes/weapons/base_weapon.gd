class_name BaseWeapon
extends Object

var _player = null
var _weapon = null

var damage_mult := 1.0
var accuracy_mult := 1.0
var reload_speed_mult := 1.0
var fire_rate_mult := 1.0
var mag_capacity_mult := 1.0

var reloading := false

var last_attack_time := 1.79769e308  # Float max
var ammo := 0.0


func _init(player):
	_player = player as Player
	_weapon = _player.find_node("Weapon", false)
	assert(_weapon)
	assert(player)
	ammo = _get_mag_capacity()


# BaseWeapon interface start.


func _on_physics_update(_delta: float):
	pass


func _on_fire() -> void:
	push_error("Must be implemented by a child class")


func _on_reload_started() -> void:
	pass


func _on_reload_finished() -> void:
	pass


func _on_picked() -> void:
	pass


func _get_reload_time() -> float:
	push_error("Must be implemented by a child class")
	return 0.0


# Shots per second
func _get_fire_rate() -> float:
	push_error("Must be implemented by a child class")
	return 0.0


func _get_mag_capacity() -> float:
	push_error("Must be implemented by a child class")
	return 0.0


func _get_texture_path() -> String:
	push_error("Must be implemented by a child class")
	return ""


# BaseWeapon interface end.


func physics_process(delta: float) -> void:
	last_attack_time += delta
	_on_physics_update(delta)


func fire():
	if reloading:
		return

	if not reloading and last_attack_time >= 1.0 / _get_fire_rate():
		last_attack_time = 0.0
		_on_fire()
		ammo -= 1
		if ammo == 0:
			reload()


func reload():
	if reloading:
		return
	reloading = true
	_weapon.run_reload_animation(_get_reload_time())
	_on_reload_started()


func reload_finished():
	reloading = false
	ammo = _get_mag_capacity()
	_on_reload_finished()


func fire_projecile(projectile_scene):
	var projectile = projectile_scene.instance()
	projectile.init(
		_player, _player.global_position.direction_to(_player.get_global_mouse_position()).angle()
	)
	_player.get_tree().current_scene.add_child(projectile)
