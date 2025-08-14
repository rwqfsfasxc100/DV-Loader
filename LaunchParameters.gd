extends HBoxContainer


var total_params = ""

var wait_timer = 0

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
	var params = PoolStringArray([])
	if enable_mods:
		params.append("--enable-mods")
	if debug_console:
		params.append("--debug-console")
	if accumulate_input:
		params.append("--accumulate_input")
	if screensaver:
		params.append("--screensaver")
		wait_timer = screensaver_wait
	else:
		wait_timer = 0
	total_params = params
