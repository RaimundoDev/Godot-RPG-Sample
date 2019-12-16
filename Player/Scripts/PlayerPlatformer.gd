extends KinematicBody2D

const SPEED = 200
const GRAVITY = 20
const JUMP_POWER = 550

var motion = Vector2(0,0)
var moveDir = Vector2(0,0)

func _ready():
	pass
	
func _physics_process(delta):
	
	get_input()

func get_input():
	
	var movimentX = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	var JUMP = Input.is_action_pressed("jump")
	
	var RUN = Input.is_action_pressed("run")
	var SLOW = Input.is_action_pressed("slow")
	
	motion.y -= GRAVITY
	
	moveDir.x = movimentX
	moveDir.x = lerp(moveDir.x, 0, 0.4)
	
	if RUN:
		motion = moveDir.normalized() * (SPEED*2)
	elif SLOW:
		motion = moveDir.normalized() * SPEED/2
	else:
		motion = moveDir.normalized() * SPEED
		
	#if is_on_floor():
	if JUMP && is_on_floor():
		motion.y -= JUMP_POWER
	
	motion = move_and_slide(motion, Vector2(0, -1))