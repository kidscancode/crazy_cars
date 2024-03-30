extends AspectRatioContainer

@export var player_num = 0

var timeout = 0.5
var block_input = false

@onready var car_scene = $SubViewportContainer/SubViewport/CarLoadingScene

func _input(event):
	if block_input:
		return
	if event is InputEventJoypadMotion and event.device == player_num:
		if abs(event.axis_value) > 0.5:
			if event.axis == JOY_AXIS_LEFT_X:  
				car_scene.current_car += sign(event.axis_value)
			elif event.axis == JOY_AXIS_LEFT_Y: 
				car_scene.current_color  += sign(event.axis_value)
			block_input = true
			await get_tree().create_timer(timeout).timeout
			block_input = false
