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
	"hatchbackSports",
	"sedan",
	"sedanSports",
	"suv",
	"taxi",
	"truck",
	"van",
]

var player_options = [
	{
		"model": 2,
		"color": 3
	},
	{
		"model": 1,
		"color": 2
	},
	{
		"model": 2,
		"color": 3
	},
	{
		"model": 3,
		"color": 4
	},
]

func _ready():
	print(Input.get_connected_joypads())
	Input.joy_connection_changed.connect(joy_connect)
	
func joy_connect(device_num, connected):
	if connected:
		print("connected: " + str(device_num))
