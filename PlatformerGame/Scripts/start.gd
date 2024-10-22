extends Control

@onready var global = get_node("/root/Global")


# Resets lives and coins and changes scene to the level
func _start():
	global.lives = global.MAX_LIVES
	global.coin = 0
	get_tree().change_scene_to_file("res://Scenes/level.tscn")


# Closes the game
func _quit():
	get_tree().quit()
