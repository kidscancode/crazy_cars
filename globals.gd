extends Node

var debug = true

var checkpoint_count = 0

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
		"model": 0,
		"color": 1
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

var icons = {
	"x": "",
	"shield": "",
	"fire": "",
	"3": "3",
	"2": "2",
	"1": "1",
	"go": "",
	"boost": "",
	"weight": "",
	"jump": "",
	"ghost": "",
	"gun": "",
	"mine": "",
	"lap1": "1-3",
	"lap2": "2-3",
	"lap3": "3-3"
}
func _ready():
	Input.joy_connection_changed.connect(joy_connect)
	
func joy_connect(device_num, connected):
	if connected:
		print("connected: " + str(device_num))
