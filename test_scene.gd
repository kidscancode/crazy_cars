extends Node3D



func _process(delta):
	#var hvel = $Car.linear_velocity
	#hvel.y = 0
	$Debug/Label.text = "%3.2f" % $Car.linear_velocity.length()
	#$Debug/Label2.text = str($Car.facing)


