extends CanvasLayer

@onready var global = get_node("/root/Global")

@onready var coins_group = get_tree().get_nodes_in_group("coins")


# Coin counter to update the label
func _coin(area):
	if area.has_meta("coin"):
		global.coin += 1


# Updates the labels visable in the level
func _process(_delta):
	$Coins.text = ("Coins: " + str(global.coin))
	$Lives.text = ("Lives: " + str(global.lives))
