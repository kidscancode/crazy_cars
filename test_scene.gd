extends Node3D

func _ready():
	spawn_cars()
	
func spawn_cars():
	pass
	# for each player (number of controllers):
		# instantiate car - car.setup(player_num)
		# instantiate subviewport container w/camera, link to car
		# position car at start
		# disable input
		# start countdown

func _process(delta):
	#var hvel = $Car.linear_velocity
	#hvel.y = 0
	$Debug/Label.text = "%3.2f" % $Car.linear_velocity.length()
	#$Debug/Label2.text = str($Car.facing)


