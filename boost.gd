extends Area3D

@export var power = 50.0

func _on_body_entered(body):
	print("boosting")
	body.apply_central_impulse(transform.basis.y * power)
	#body.apply_central_impulse(-body.car_mesh.transform.basis.z * power)
