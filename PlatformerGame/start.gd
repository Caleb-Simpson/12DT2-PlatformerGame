extends Control

@onready var global = get_node("/root/Global")

func _start():
	global.lives = 5
	global.coin = 0
	get_tree().change_scene_to_file("res://level.tscn")
