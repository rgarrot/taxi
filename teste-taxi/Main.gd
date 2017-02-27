extends Node2D

var timer

func _ready():
		
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer)
	timer.set_autostart(true)
	timer.set_wait_time(15)
	timer.start()
	#print(timer.is_active())
	#print(timer.get_time_left())
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	#print(timer.get_time_left())
	pass

var x
var y

func _on_timer_timeout():
	
	randomize()
	
	x = randi()%500
	y = randi()%500
	print(Globals.get("passenger1"))
	print(Globals.get("passenger"))
	
	if (not Globals.get("passenger1")):
		get_node("client/passenger1").set_pos(Vector2(x,y))
	if (not Globals.get("passenger")):
		get_node("client/passenger").set_pos(Vector2(x,y))

	pass

func _on_control_visibility_changed():
	#get_tree().change_scene("res://num_sprite.tscn")
	print('uhul')
	pass # replace with function body
