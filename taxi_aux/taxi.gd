extends Area2D

var rotation = 0
var speed_rotation = 0.02
var obj
var pos = get_pos()
var speed = 100


func _fixed_process(delta):	

	var motion = Vector2()
	
	if(Input.is_action_pressed("ui_down")):
		motion += (Vector2(-sin(rotation),-cos(rotation))) #move down 1 pixel per physics frame
	if(Input.is_action_pressed("ui_up")):
		motion += ( Vector2(sin(rotation),cos(rotation))) #move down 1 pixel per physics frame
	if(Input.is_action_pressed("ui_left")):
		rotation += speed_rotation
	if(Input.is_action_pressed("ui_right")):
		rotation -= speed_rotation
		 
	var pos = get_pos()
	
	pos += motion*delta*speed
	
	set_pos(pos)
	set_rot(rotation)
		
func _hit_somethig():
	print('oi')
	pass


func _ready():
    set_fixed_process(true)



func _on_taxi_area_enter( area ):
	if (area.has_method("is_passenger") and area.is_passenger()):
		get_tree().change_scene("res://Control.tscn")
		print(Globals.get("yes"))
		if (Globals.get("yes")):
			area.hide()
		else:
			print(Globals.get("yes"))
			print("achei que daria certo")
	pass # replace with function body



func _on_taxi_body_enter( body ):
	print("Vish ficou batendo")
	pass # replace with function body
