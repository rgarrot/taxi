extends KinematicBody2D

var rotation = 0
var speed_rotation = 0.02
var obj


func _fixed_process(delta):	

	if(Input.is_action_pressed("ui_down")):
    	move( Vector2(-sin(rotation),-cos(rotation))) #move down 1 pixel per physics frame
	if(Input.is_action_pressed("ui_up")):
    	move( Vector2(sin(rotation),cos(rotation))) #move down 1 pixel per physics frame
	if(Input.is_action_pressed("ui_left")):
    	#move( Vector2(-1,0) ) #move down 1 pixel per physics frame
		rotation += speed_rotation
		rotate(speed_rotation)
	if(Input.is_action_pressed("ui_right")):
		rotation -= speed_rotation
		rotate(-speed_rotation)
    	#move( Vector2(1,0) ) #move down 1 pixel per physics frame
	

	if(get_node("../taxi").is_colliding()):
		obj = get_collider().get_name()
		if (Globals.get("yes") == true):
			get_node("../" + obj).remove_child("collision")
			get_node("../control").set_hidden(1)
		if (obj == "passenger" and (Globals.get("yes")==false)):
			get_node("../control").set_hidden(0)
		#	get_node("taxi").co
func _ready():
    set_fixed_process(true)
		
func _ready():
    set_fixed_process(true)

