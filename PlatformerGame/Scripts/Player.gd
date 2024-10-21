extends CharacterBody2D

@onready var global = get_node("/root/Global")
@onready var coins_group = get_tree().get_nodes_in_group("coins")

@export var speed = 200.0
@export var jump_velocity = -300.0

var coin = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


# Handles player movement
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_velocity

	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed 
		$Sprite2D.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()


# Increases coin counter when the player has collided with a coin
func _coin(area):
	if area.has_meta("coin"):
		global.coin += 1


# Detects when the player has collided with a harmful object, resets the scene and removes one life
func _death(area):
	if area.has_meta("spike") or area.has_meta("killbox"):
		if global.lives > 1:
			get_tree().reload_current_scene.call_deferred()
			global.lives -= 1
			global.coin = 0
		elif global.lives <= 1:
			get_tree().change_scene_to_file.call_deferred("res://Scenes/game_over.tscn")


# Changes the scene to the 'Win screen' when the player reaches the door at the end of the level
func _win(area):
	if area.has_meta("door"):
		get_tree().change_scene_to_file("res://Scenes/end.tscn")
