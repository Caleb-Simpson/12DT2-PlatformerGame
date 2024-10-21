extends Area2D


func _ready():
	pass


func _process(_delta):
	pass


# Deletes a coin once it has been collided into by the player
func _collect(body):
	if body.has_meta("collect"):
		queue_free()
