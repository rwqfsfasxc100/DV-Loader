extends Button

var OK_TO_LAUNCH_FROM_EXECUTABLE := false
var EXECUTABLE_PATH := ""
var LAUNCH_PARAMETERS := PoolStringArray()
var DELAY := 0

onready var vars = get_parent().get_parent().get_parent()

func _process(delta):
	var lp = get_parent().get_node("LaunchParameters")
	var launch_params = lp.total_params
	var execheck = get_parent().get_node("HBoxContainer/ExeCheck")
	OK_TO_LAUNCH_FROM_EXECUTABLE = execheck.OK_TO_LAUNCH
	EXECUTABLE_PATH = execheck.EXECUTABLE_PATH
	LAUNCH_PARAMETERS = launch_params
	DELAY = lp.wait_timer

var PROCESS_ID = 0

func _pressed():
	if OK_TO_LAUNCH_FROM_EXECUTABLE:
		if DELAY > 0:
			var timer = $Timer
			timer.wait_time = DELAY
			timer.one_shot = true
			timer.start(DELAY)
		else:
			_timeout()
		pass
		
		


func _timeout():
	if vars.GAME_HAS_LAUNCHED == false:
		vars.GAME_HAS_LAUNCHED = true
		PROCESS_ID = OS.execute(EXECUTABLE_PATH,LAUNCH_PARAMETERS, false)
		
	else:
		pass
