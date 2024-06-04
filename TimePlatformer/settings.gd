extends Control

@onready var global = get_node("/root/Global")

func _resume():
	get_tree().change_scene_to_file("res://level.tscn")
