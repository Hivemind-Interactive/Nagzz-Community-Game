extends Control


func _ready():
	pass


func _on_Start_pressed():
	get_tree().change_scene("res://scenes/test_scene.tscn")


func _on_Options_pressed():
	pass


func _on_Credits_pressed():
	pass


func _on_Quit_pressed():
	get_tree().quit()
