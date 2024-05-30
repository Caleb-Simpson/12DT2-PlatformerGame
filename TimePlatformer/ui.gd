extends CanvasLayer

@onready var global = get_node("/root/Global")

var coins = 0

@onready var coins_group = get_tree().get_nodes_in_group("coins")

# Called when the node enters the scene tree for the first time.
func _ready():
	for coin in coins_group:
		coins += 1

func _coin(area):
	if area.has_meta("coin"):
		global.coin += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Coins.text = ("Coins: " + str(global.coin))
	$Lives.text = ("Lives: " + str(global.lives))
	_respawn()
	if Input.is_action_just_pressed("Settings"):
		_settings()
	
func _settings():
	get_tree().change_scene_to_file("res://settings.tscn")

func _respawn():
	$Respawn.hide()
	if global.lives <= 0:
		$Respawn.show()
