extends Control

onready var tie = get_node("panel/text_interface_engine")

func select_demo():
	
	timer.start()
	tie.reset()	
	tie.set_color(Color(1,1,1))
	# Buff text: "Text", duration (in seconds) of each letter
	tie.buff_text("Olá, ", 0.1)
	tie.buff_text("gostaria muito de ir a :\n", 0.05)
	tie.buff_text("Poderia me levar?\n", 0.1)
	# Buff silence: Duration of the silence (in seconds)
	tie.buff_silence(1)
	tie.set_state(tie.STATE_OUTPUT)

var button_no
var button_yes
var timer 

func _ready():
	
	Globals.set("yes",false)
	timer =get_node("timer")	
	button_no = get_node("no")
	button_yes = get_node("yes")
	button_no.set_disabled(true)
	button_yes.set_disabled(true)
	
	#add_child(timer)
	timer.set_autostart(1)
	timer.set_wait_time( 3 )
	timer.start()
	button_no.connect("pressed", self, "_on_no_pressed")
	button_yes.connect("pressed", self, "_on_yes_pressed")
	timer.connect("timeout", self, "_on_Timer_timeout")
	# Connect every signal to check them using the "print()" method
	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")
	select_demo()
	pass

#var yes = false

func _on_yes_pressed():
	Globals.set("yes",true)
	button_no.set_disabled(true)
	button_yes.set_disabled(true)
	tie.add_newline()
	tie.buff_text("Sucesso, então vamos ", 0.1)
	tie.buff_silence(1)
	tie.set_state(tie.STATE_OUTPUT)
	#yes = true
	timer.start()
	pass # replace with function body


func _on_no_pressed():
	
	button_no.set_disabled(true)
	button_yes.set_disabled(true)
	
	tie.add_newline()
	tie.buff_text("Affz, que absurdo, vou ter que chamar o uber ", 0.1)
	tie.buff_silence(1)
	tie.set_state(tie.STATE_OUTPUT)
	pass # replace with function body
	
var pressed = false
func _on_Timer_timeout():
	if (pressed):
		get_tree().change_scene("res://Main.tscn")
	button_yes.set_disabled(false)
	button_no.set_disabled(false)
	pressed = true
	timer.stop()
	pass
	
func _on_buff_end():
	print("Buff End")
	pass

func _on_state_change(i):
	print("New state: ", i)
	pass

func _on_enter_break():
	print("Enter Break")
	pass

func _on_resume_break():
	print("Resume Break")
	pass

func _on_tag_buff(s):
	print("Tag Buff ",s)
	pass

