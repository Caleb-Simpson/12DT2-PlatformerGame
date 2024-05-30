extends CharacterBody2D

@onready var global = get_node("/root/Global")

@onready var coins_group = get_tree().get_nodes_in_group("coins")

@export var speed = 200.0
@export var jump_velocity = -300.0

var coin = 0
var coins = 0
var lock = false
var respawn = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	for coin in coins_group:
		coins += 1

func _physics_process(delta):
	if global.lives <= 0 and Input.is_action_pressed("Respawn"):
		_respawn(CharacterBody2D)
		respawn = true
	if not lock:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = jump_velocity

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("Left", "Right")
		if direction:
			velocity.x = direction * speed 
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
	
		move_and_slide()
		
func _coin(area):
	if area.has_meta("coin"):
		global.coin += 1
		
func _death(area):
	if area.has_meta("spike") or area.has_meta("floor"):
		if global.lives > 0:
			position = Vector2(254, 121)
			global.lives -= 1
		if global.lives <= 0:
			lock = true
			hide()

func _respawn(area):
	respawn = false
	lock = false
	show()
	global.coin = 0
	global.lives = 3
	get_tree().reload_current_scene()
