extends FileDialog

var filter = PoolStringArray(["*.pck"])

func _ready():
	var os = OS.get_name().to_upper()
	if os == "WINDOWS":
		filter.append("*.exe")
	if os == "X11":
		filter.append("*.x86_64")
	filters = filter

func _on_FileDialog_file_selected(path):
	self.hide()
	var n = get_parent().get_node("VerticalRect/BottomContainer/HBoxContainer")
	n.get_node("LineEdit").text = path
	n.get_node("ExeCheck")._text_changed(path)
