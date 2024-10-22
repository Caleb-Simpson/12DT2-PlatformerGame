extends Path2D

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer


# If the path is open it plays the animation and stops the closed function from running
func _ready():
	# Is the platform a open path
	if not loop:
		animation.play("move")
		animation.speed_scale = speed_scale
		set_process(false)


# If the path is closed this functions runs because the animation isnt needed for closed paths
func _process(_delta):
	path.progress += speed
