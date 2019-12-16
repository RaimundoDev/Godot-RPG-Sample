extends KinematicBody2D

const SPEED = 200
var moveDir = Vector2(0,0)

func _ready():
	pass
	
func _physics_process(delta):
	
	get_input()

func get_input():
	
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	var RUN = Input.is_action_pressed("run")
	var SLOW = Input.is_action_pressed("slow")
	
	var motion
	
	if RUN:
		motion = moveDir.normalized() * (SPEED*2)
	elif SLOW:
		motion = moveDir.normalized() * SPEED/2
	else:
		motion = moveDir.normalized() * SPEED
	
	moveDir.x = -int(LEFT) + int(RIGHT)
	moveDir.y = -int(UP) + int(DOWN)
	
	move_and_slide(motion, Vector2(0,0))