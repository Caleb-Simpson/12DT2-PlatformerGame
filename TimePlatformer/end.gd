extends Control

@onready var global = get_node("/root/Global")

func _replay():
	global.lives = 3
	global.coin = 0
	get_tree().change_scene_to_file("res://level.tscn")

func _menu():
	global.lives = 3
	global.coin = 0
	get_tree().change_scene_to_file("res://Start.tscn")
	
