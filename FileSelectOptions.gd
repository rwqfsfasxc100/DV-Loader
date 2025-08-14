extends WindowDialog



func _pressed():
	popup()


func _on_Presets_pressed():
	get_parent().get_node("PresetMenu").popup()
	self.hide()


func _on_FilePicker_pressed():
	get_parent().get_node("FileDialog").popup()
	self.hide()
