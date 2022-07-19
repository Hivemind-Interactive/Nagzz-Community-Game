extends Node2D


onready var _player := self.get_parent() as Player
onready var _sprite := $WeaponSprite


var current_weapon: BaseWeapon = null


func _ready():
	# TODO this is for testing, should be replaced with a proper way to pick up a weapon
	pickup_weapon("res://scenes/weapons/pistol/pistol.gd")


func pickup_weapon(weapon_script_path: String):
	current_weapon = load(weapon_script_path).new(_player) as BaseWeapon
	$WeaponSprite.set_texture(load(current_weapon.get_texture_path()))
	current_weapon.on_picked()
	

func clear_weapon():
	current_weapon = null
	$WeaponSprite.set_texture(null)


func rotate_to_cursor():
	var mouse_pos := get_global_mouse_position()
	look_at(mouse_pos)
	# Mirror weapon sprite if facing left.
	_sprite.flip_v = global_position.x - mouse_pos.x > 0


func _physics_process(delta: float):
	if not current_weapon: return
	
	rotate_to_cursor()
	
	current_weapon.physics_update(delta)
	
	if Input.is_action_pressed("attack"):
		current_weapon.on_fire(delta)
	
	if Input.is_action_just_pressed("reload"):
		current_weapon.on_reload(delta)

