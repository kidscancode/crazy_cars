# body_mesh.set_surface_override_material() 0 (shell) 2 (body)
extends Node3D

var current_car = 0:
	set = choose_car
	
var current_color = 0:
	set = set_color

@onready var model = $Model

func choose_car(num):
	num = wrapi(num, 0, Globals.car_models.size()-1)
	model.get_child(current_car).hide()
	model.get_child(num).show()
	current_car = num
	set_car_material()
	
func set_color(num):
	current_color = wrapi(num, 0, Globals.car_colors.size())
	set_car_material()

func set_car_material():
	var body = model.get_child(current_car).get_child(0).get_child(0)
	#body.set_surface_override_material(0, Globals.car_colors[num])
	body.set_surface_override_material(2, Globals.car_colors[current_color])
	if current_car == 2:
		body.get_child(0).set_surface_override_material(1, Globals.car_colors[current_color])
