extends MarginContainer

@onready var car_displays = $VBoxContainer/HBoxContainer

func _ready():
	Input.joy_connection_changed.connect(joy_connect)
	var connected_controllers = Input.get_connected_joypads()
	for display in car_displays.get_children():
		if display.player_num in connected_controllers:
			display.set_active(true)
		else:
			display.set_active(false)
	
func joy_connect(device_num, connected):
	if connected:
		print("connected: " + str(device_num))
		car_displays.get_child(device_num).set_active(true)
	else:
		print("disconnected: " + str(device_num))
		car_displays.get_child(device_num).set_active(false)
