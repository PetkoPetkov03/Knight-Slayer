extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 40
const MAXFALLSPEED = 450
const MAXSPEED = 625
const JUMPFORCE = 600
const ACCEL = 100

var facing_right = true

var motion = Vector2()
func _ready():
	pass
	
func _physics_process(delta):
	motion.y += GRAVITY
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		#$AnimationPlayer.play("run")
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		#$AnimationPlayer.play("run")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		#$AnimationPlayer.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = -JUMPFORCE
			#$AnimationPlayer.play("jump")
	motion = move_and_slide(motion,UP)
