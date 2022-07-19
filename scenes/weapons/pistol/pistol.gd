extends BaseWeapon


const PROJECTILE_SCENE = preload("res://scenes/projectiles/testprojectile.tscn")


# TODO some of this logic should go to player's weapon node instead, or to base weapon class
# TODO add reload

var attack_speed := 0.4
var last_attack_time := attack_speed + 1


func _init(player).(player):
	pass


func physics_update(delta: float):
	last_attack_time += delta


func on_fire(_delta: float):
	if last_attack_time >= attack_speed:
		last_attack_time = 0.0
		fire_projecile()


func on_reload(_delta: float):
	push_error("Must be implemented by a child class")


func on_picked():
	pass


func get_texture_path() -> String:
	return "res://assets/placeholder/dummy_gun.png"


func fire_projecile():
	var projectile = PROJECTILE_SCENE.instance()
	projectile.init(_player, _player.global_position.direction_to(_player.get_global_mouse_position()).angle())
	_player.get_tree().current_scene.add_child(projectile)
