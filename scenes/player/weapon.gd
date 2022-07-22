extends Node2D

onready var _player := self.get_parent() as Player
onready var _sprite := $WeaponSprite
onready var _reload := $"../ReloadIndicator"

var current_weapon: BaseWeapon = null


func _ready():
	# TODO this is for testing, should be replaced with a proper way to pick up a weapon
	pickup_weapon("res://scenes/weapons/pistol/pistol.gd")

	var connect_err = _reload.connect("reload_finished", self, "_on_reload_finished")
	if connect_err != OK:
		push_error("Failed to connect to reload signal.")


func pickup_weapon(weapon_script_path: String):
	current_weapon = load(weapon_script_path).new(_player) as BaseWeapon
	$WeaponSprite.set_texture(load(current_weapon._get_texture_path()))
	current_weapon._on_picked()


func clear_weapon():
	current_weapon = null
	$WeaponSprite.set_texture(null)


func rotate_to_cursor():
	var mouse_pos := get_global_mouse_position()
	look_at(mouse_pos)
	# Mirror weapon sprite if facing left.
	_sprite.flip_v = global_position.x - mouse_pos.x > 0


func _physics_process(delta: float):
	if not current_weapon:
		return

	rotate_to_cursor()

	current_weapon.physics_process(delta)

	if Input.is_action_pressed("attack"):
		current_weapon.fire()

	if Input.is_action_just_pressed("reload"):
		current_weapon.reload()


func run_reload_animation(reload_time_seconds: float):
	_reload.run_reload(reload_time_seconds)


func _on_reload_finished():
	current_weapon.reload_finished()
