extends KinematicBody2D

const UP = Vector2(0, -1)
const ACC = 20

const GAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 80

const motion = Vector2()
func _ready():
	pass

func _physics_process(delta):
	motion.y += GAVITY
	if Input.is_action_pressed("left"):
		motion.x = -ACC
	elif Input.is_action_just_pressed("right"):
		motion.x = ACC
	else:
		 motion.x = 0
