extends Control

@onready var global = get_node("/root/Global")


# Resets coins and lives and changes scene to the level
func _replay():
	global.lives = 5
	global.coin = 0
	get_tree().change_scene_to_file("res://Scenes/level.tscn")


# Resets coins and lives and changes scene to the main menu
func _menu():
	global.lives = 5
	global.coin = 0
	get_tree().change_scene_to_file("res://Scenes/Start.tscn")
