extends CanvasLayer

@onready var global = get_node("/root/Global")

@onready var coins_group = get_tree().get_nodes_in_group("coins")

func _coin(area):
	if area.has_meta("coin"):
		global.coin += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Coins.text = ("Coins: " + str(global.coin))
	$Lives.text = ("Lives: " + str(global.lives))
	_respawn()
	
func _respawn():
	$Respawn.hide()
	if global.lives <= 0:
		$Respawn.show()
