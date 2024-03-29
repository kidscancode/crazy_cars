extends Node

var debug = true

func _ready():
	Input.joy_connection_changed.connect(joy_connect)
	
func joy_connect(device_num, connected):
	if connected:
		print(device_num)
