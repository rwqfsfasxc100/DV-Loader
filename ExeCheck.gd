extends Button

var OK_TO_LAUNCH := false

onready var ico = $TextureRect

var fail_icon = "res://icons/ic_fluent_error_circle_48_regular.stex"
var warning_icon = "res://icons/ic_fluent_warning_48_regular.stex"
var success_icon = "res://icons/ic_fluent_checkmark_48_filled.stex"

var fail_modulate = Color(2048,0,0)
var warning_modulate = Color(2048,2048,0)
var success_modulate = Color(0,2048,0)

var fail_tooltip = "Game exacutable not found at the selected file path"
var fail_tooltip_incorrect_file_windows = "File path provided does not have a .pck or .exe extension"
var fail_tooltip_incorrect_file_x11 = "File path provided does not have a .pck or .86_64 extension"
var warning_tooltip_exe_only = "Game executable found, but game pck not found"
var warning_tooltip_pck_only = "Game pck found, but game executable not found"
var success_tooltip = "Game files successfully found at the selected file path"

var WINDOWS_EXTENSION = ".exe"
var X11_EXTENSION = ".x86_64"

func _ready():
	ico.texture = load(fail_icon)
	ico.modulate = fail_modulate
	self.hint_tooltip = fail_tooltip

var os = OS.get_name().to_upper()

var folder_or_file = "file"

var error = 0

var executable = ""
var pack = ""

func _text_changed(new_text):
	executable = ""
	pack = ""
	error = 0
	
	var path = ProjectSettings.globalize_path(new_text)
	var exe_to_expect = "Delta-V"
	var pck = "Delta-V.pck"
	if os == "WINDOWS":
		exe_to_expect = exe_to_expect + WINDOWS_EXTENSION
		if path.ends_with(".pck") or path.ends_with(WINDOWS_EXTENSION):
			folder_or_file = "file"
		else:
			folder_or_file = "folder"
	
	
	if os == "X11":
		exe_to_expect = exe_to_expect + X11_EXTENSION
		if path.ends_with(".pck") or path.ends_with(X11_EXTENSION):
			folder_or_file = "file"
		else:
			folder_or_file = "folder"
	
	if folder_or_file == "folder":
		ico.texture = load(fail_icon)
		ico.modulate = fail_modulate
		if os == "WINDOWS":
			self.hint_tooltip = fail_tooltip_incorrect_file_windows
		if os == "X11":
			self.hint_tooltip = fail_tooltip_incorrect_file_x11
		else:
			self.hint_tooltip = "Operating system not detected, cannot identify the proper executable type"
		
	else:
		
		var dir = Directory.new()
		if dir.file_exists(new_text):
			var folder = new_text.split(str(new_text).split("/")[new_text.split("/").size() - 1])[0]
			executable = folder + exe_to_expect
			pack = folder + pck
			if dir.file_exists(executable):
				error +=1
			if dir.file_exists(pack):
				error +=1
			
	var dir = Directory.new()
	if error == 0:
		ico.texture = load(fail_icon)
		ico.modulate = fail_modulate
		self.hint_tooltip = fail_tooltip
	if error == 1:
		ico.texture = load(warning_icon)
		ico.modulate = warning_modulate
		if dir.file_exists(executable):
			self.hint_tooltip = warning_tooltip_exe_only
		if dir.file_exists(pack):
			self.hint_tooltip = warning_tooltip_pck_only
	if error == 2:
		ico.texture = load(success_icon)
		ico.modulate = success_modulate
		self.hint_tooltip = success_tooltip
	if os == "OSX":
		ico.texture = load(fail_icon)
		ico.modulate = fail_modulate
		self.hint_tooltip = "OS X is not yet supported. Please contact the developer for help"
		error = 0

func _process(delta):
	if error == 2:
		OK_TO_LAUNCH = true
	else:
		OK_TO_LAUNCH = false
	get_parent().get_parent().get_node("LAUNCH").OK_TO_LAUNCH_FROM_EXECUTABLE = OK_TO_LAUNCH
