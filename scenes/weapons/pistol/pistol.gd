extends BaseWeapon

const PROJECTILE_SCENE = preload("res://scenes/projectiles/testprojectile.tscn")

const BASE_RELOAD_TIME := 1.0
const BASE_FIRE_RATE := 2.0
const BASE_MAG_CAPACITY := 3.0


func _init(player).(player):
	pass


func _on_fire():
	fire_projecile(PROJECTILE_SCENE)


func _get_reload_time():
	return BASE_RELOAD_TIME * reload_speed_mult


func _get_fire_rate() -> float:
	return BASE_FIRE_RATE * fire_rate_mult


func _get_mag_capacity() -> float:
	return BASE_MAG_CAPACITY * mag_capacity_mult


func _get_texture_path() -> String:
	return "res://assets/placeholder/dummy_gun.png"
