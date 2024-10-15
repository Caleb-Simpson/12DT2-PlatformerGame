extends Area2D


func _ready():
	pass


func _process(_delta):
	pass

func _collect(body):
	if body.has_meta("collect"):
		queue_free()
