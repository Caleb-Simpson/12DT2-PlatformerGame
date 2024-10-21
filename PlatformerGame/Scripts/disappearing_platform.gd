extends StaticBody2D

var time = 1


# Stops the process function from running when the game opens
func _ready():
	set_process(false)
	
	
# Increases the timer and shakes the platform once the player has collided with it
func _process(_delta):
	time += 1
	$Sprite2D.position += Vector2(0, sin(time) * 2)


# Detects the player, starts the timer and starts the process function
func _on_area_2d_body_entered(body):
	if body.name == 'player':
		set_process(true)
		$Timer.start(0.7)


# Deletes the platform once the timer has ended
func _on_timer_timeout():
	queue_free()
