extends Node

var debug = true

var car_colors = [
	preload("res://assets/car_mats/black_paint.tres"),
	preload("res://assets/car_mats/blue_paint.tres"),
	preload("res://assets/car_mats/green_paint.tres"),
	preload("res://assets/car_mats/red_paint.tres"),
	preload("res://assets/car_mats/yellow_paint.tres"),
]

var car_models = [
	preload("res://assets/GLTF format/hatchbackSports.glb"),
	preload("res://assets/GLTF format/sedan.glb"),
	preload("res://assets/GLTF format/sedanSports.glb"),
	preload("res://assets/GLTF format/suv.glb"),
	preload("res://assets/GLTF format/taxi.glb"),
	preload("res://assets/GLTF format/truck.glb"),
	preload("res://assets/GLTF format/van.glb"),
]

var player_options = [
	{
		"model": car_models[0],
		"color": car_colors[1]
	},
	{
		"model": car_models[1],
		"color": car_colors[2]
	},
	{
		"model": car_models[2],
		"color": car_colors[3]
	},
	{
		"model": car_models[3],
		"color": car_colors[4]
	},
]

func _ready():
	Input.joy_connection_changed.connect(joy_connect)
	
func joy_connect(device_num, connected):
	if connected:
		print(device_num)
