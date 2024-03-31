extends VBoxContainer

@export var player_num = 0

var timeout = 0.5
var block_input_x = false
var block_input_y = false
var locked = false

@onready var vp_container = $CarLoadingViewport/SubViewportContainer
@onready var car_scene = $CarLoadingViewport/SubViewportContainer/SubViewport/CarLoadingScene

func set_active(on):
	if on:
		vp_container.material.blend_mode = CanvasItemMaterial.BLEND_MODE_MIX
	else:
		vp_container.material.blend_mode = CanvasItemMaterial.BLEND_MODE_MUL
		
#func _process(delta):
	#if block_input:
		#return
	#var h = Input.get_joy_axis(player_num, JOY_AXIS_LEFT_X)
	#var v = Input.get_joy_axis(player_num, JOY_AXIS_LEFT_Y)

func _ready():
	vp_container.material = vp_container.material.duplicate()
	$Label.text = "      "
	car_scene.current_car = Globals.player_options[player_num]["model"]
	car_scene.current_color = Globals.player_options[player_num]["color"]
	
func _input(event):
	if event.device != player_num:
		return
	if event is InputEventJoypadButton:
		if event.button_index == JOY_BUTTON_A and not locked:
			locked = true
			$Label.text = "Ready!"
			Globals.player_options[player_num]["model"] = car_scene.current_car
			Globals.player_options[player_num]["color"] = car_scene.current_color
		if event.button_index == JOY_BUTTON_B and locked:
			locked = false
			$Label.text = "      "
	if event is InputEventJoypadMotion and not locked:
		if abs(event.axis_value) > 0.9:
			if event.axis == JOY_AXIS_LEFT_X and not block_input_x:  
				car_scene.current_car += sign(event.axis_value)
				block_input_x = true
			elif event.axis == JOY_AXIS_LEFT_Y and not block_input_y: 
				car_scene.current_color += sign(event.axis_value)
				block_input_y = true
		if abs(event.axis_value) < 0.1:
			if event.axis == JOY_AXIS_LEFT_X and block_input_x:  
				block_input_x = false
			elif event.axis == JOY_AXIS_LEFT_Y and block_input_y: 
				block_input_y = false
