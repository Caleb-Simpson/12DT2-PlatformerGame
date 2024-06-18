extends StaticBody2D

@onready var global = get_node("/root/Global")

func _process(delta):
	_timer()

func _timer():
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.autostart = false
	timer.wait_time = 3.0
	timer.timeout.connect(_move)
	timer.start()
	
func _move():
	hide()
