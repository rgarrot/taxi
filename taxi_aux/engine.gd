extends RigidBody2D

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
	
	if(is_colliding()):
		obj = get_collider()
		if (obj == KinematicBody2D):
			print('fooi')
		print(obj)
		
func _ready():
    set_fixed_process(true)

