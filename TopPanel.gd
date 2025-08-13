extends Button

var window_pos = Vector2(0,0)
var clicking = false
var relative = Vector2(0,0)

func _ready():
	OS.window_position = Vector2(0,0)

func _process(delta):
	window_pos = OS.window_position
	
	if clicking:
		window_pos = window_pos + relative
		OS.window_position = window_pos
		
		pass
	get_parent().get_node("VBoxContainer2/pos").text = "Clicking: " + str(clicking) + " Combined: " + str(window_pos + relative) + " Base: " + str(window_pos) + " Relative: " + str(relative)
	


func _input(event):
	if event is InputEventMouseMotion:
		relative = event.relative
		





func _button_down():
	clicking = true


func _button_up():
	clicking = false
