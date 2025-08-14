extends FileDialog



func _on_FileDialog_file_selected(path):
	self.hide()
	var n = get_parent().get_node("BottomContainer/HBoxContainer")
	n.get_node("LineEdit").text = path
	n.get_node("ExeCheck")._text_changed(path)
