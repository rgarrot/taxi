extends Sprite

var x = 26.5
var y = 29.7
var nx
var ny
var img_num

func _ready():
	
	randomize()
	nx = randi()%20
	ny = randi()%10

	Globals.set("num",ny)
	img_num = get_node(".")
	img_num.set_region_rect(Rect2(nx*x, ny*y, x, y))
	pass


