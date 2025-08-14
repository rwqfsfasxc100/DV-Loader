extends Popup

onready var n = get_parent().get_node("VerticalRect/BottomContainer/HBoxContainer")
var path = ""
onready var os = OS.get_name().to_upper()

func _on_Cancel_pressed():
	self.hide()


func _on_Steam_pressed():
	var dir = ""
	var steamsuffix = "Steam/steamapps/common/dV Rings of Saturn/Delta-V"
	match os:
		"WINDOWS":
			dir = "C://Program Files (x86)/" + steamsuffix + ".exe"
			path = dir
		"X11":
			dir = ProjectSettings.globalize_path("user://").split("dV_Loader/")[0] + steamsuffix + ".x86_64"
			path = dir
		"OSX":
			pass
	OK()

func _on_Gog_pressed():
	match os:
		"WINDOWS":
			path = ""
		"X11":
			path = ""
		"OSX":
			pass
	OK()

func _on_Itch_pressed():
	match os:
		"WINDOWS":
			path = ""
		"X11":
			path = ""
		"OSX":
			pass
	OK()

func _on_Epic_pressed():
	match os:
		"WINDOWS":
			path = ""
		"X11":
			path = ""
		"OSX":
			pass
	OK()


func OK():
	pass
	
	n.get_node("LineEdit").text = path
	n.get_node("ExeCheck")._text_changed(path)
	_on_Cancel_pressed()
