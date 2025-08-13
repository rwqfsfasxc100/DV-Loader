extends Button



func _on_Button_pressed():
	var pid = OS.get_process_id()
	OS.kill(pid)

