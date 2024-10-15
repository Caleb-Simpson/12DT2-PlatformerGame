extends Control

@onready var global = get_node("/root/Global")

func _replay():
	global.lives = 5
	global.coin = 0
	get_tree().change_scene_to_file("res://level.tscn")

func _quit():
	get_tree().quit()
