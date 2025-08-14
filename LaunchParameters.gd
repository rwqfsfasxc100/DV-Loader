extends HBoxContainer


var params : Dictionary = {}


onready var ENBLMDS = $Panel/VBoxContainer/HBoxContainer2/EnableMods
onready var DBGCSL = $Panel/VBoxContainer/HBoxContainer2/DebugConsole
onready var SCRNSVR = $Panel/VBoxContainer/HBoxContainer3/HBoxContainer/Screensaver
onready var ACCINPT = $Panel/VBoxContainer/HBoxContainer3/HBoxContainer/AccumulateInput
onready var SCRNTMR = $Panel/VBoxContainer/HBoxContainer3/HBoxContainer/SpinBox

func _process(delta):
	var enable_mods = ENBLMDS.pressed
	var debug_console = DBGCSL.pressed
	var accumulate_input = ACCINPT.pressed
	var screensaver = SCRNSVR.pressed
	var screensaver_wait = SCRNTMR.value
	if screensaver:
		SCRNTMR.editable = true
	else:
		SCRNTMR.editable = false
	
	
	
	pass
