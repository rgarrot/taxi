extends KinematicBody2D

var pos
var rotation = 0
var speed_rotation = 0.02
var obj
var interval 
var control #saves the control instance
var passenger
var score = 0
var obj_passenger
var score_points
var ny
var previous_passenger
var i=0

func _fixed_process(delta):	

	if(Input.is_action_pressed("ui_down")):
    	move( Vector2(-sin(rotation),-cos(rotation))) #move down 1 pixel per physics frame
	if(Input.is_action_pressed("ui_up")):
    	move( Vector2(sin(rotation),cos(rotation))) #move down 1 pixel per physics frame
	if(Input.is_action_pressed("ui_left")):
		rotation += speed_rotation
		rotate(speed_rotation)
	if(Input.is_action_pressed("ui_right")):
		rotation -= speed_rotation
		rotate(-speed_rotation)

	score_points = get_node("hub/score_points")
	ny = Globals.get("num")
	
	if (get_node("../taxi").is_colliding()):
		obj = get_collider().get_name()
		if (obj == "passenger" or obj == "passenger1" and not Globals.get("yes")):
			i+=1
			obj_passenger = obj
			passenger = get_node("../client/"+obj)
			Globals.set(obj,true)
			if (i==1):
				add_to_group("res://control.tscn")
				control = load("res://control.tscn").instance()
				control.set_pos(passenger.get_global_pos())
				get_node("..").add_child(control)
		if (Globals.get("yes") and Input.is_action_pressed("ui_accept")):
			if (obj == "num" + str(ny)):
				previous_passenger = obj_passenger
				score += 10
				Globals.set("yes",false)
				timer.start()
				passenger.set_pos(get_node("../TileMap/"+obj).get_pos())
			else:
				print("estupido nao ve que e o numero:",ny)
			score_points.set_text(str(score))				
			
	if (Globals.get("end")):
		get_node("..").remove_child(control)
		passenger.set_pos(Vector2(-100,-100))
		Globals.set("end",false)
		i=0
	
var timer 
	
func _ready():
	
	timer = Timer.new()
	add_child(timer)
	timer.set_wait_time(5)	
	timer.connect("timeout",self,"_on_timer_timeout") 
	set_fixed_process(true)
	Globals.set("yes",false)
	Globals.set("no", false)
	Globals.set("passenger1", false)
	Globals.set("passenger",true)
	Globals.set("end",false)
	
	pass

func _on_timer_timeout():
	print(str(previous_passenger))
	Globals.set(str(previous_passenger),false)
	get_node("../client/"+previous_passenger).set_pos(Vector2(-100,-100))
	timer.stop()
	pass