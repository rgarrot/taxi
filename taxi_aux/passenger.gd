extends Area2D

var happy = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _create():
	print('ok')
	pass

func is_passenger():
	return not happy 

func _on_passenger_hide():
	happy = true
	pass # replace with function body
