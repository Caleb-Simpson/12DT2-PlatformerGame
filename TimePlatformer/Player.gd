extends CharacterBody2D

@onready var global = get_node("/root/Global")

@onready var coins_group = get_tree().get_nodes_in_group("coins")

@export var speed = 200.0
@export var jump_velocity = -300.0

var coin = 0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
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
			$Sprite2D.scale.x = direction
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
	
		move_and_slide()
		
func _coin(area):
	if area.has_meta("coin"):
		global.coin += 1
		
func _death(area):
	if area.has_meta("spike"):
		if global.lives > 1:
			get_tree().reload_current_scene()
			global.lives -= 1
			global.coin = 0
		elif global.lives <= 1:
			get_tree().change_scene_to_file("res://game_over.tscn")

func _win(area):
	if area.has_meta("door"):
		get_tree().change_scene_to_file("res://End.tscn")
