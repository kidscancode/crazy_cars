extends Area3D

func _ready():
	$fan/AnimationPlayer.play("Cylinder_004Action")
	$fan/AnimationPlayer.speed_scale = 2.0
	gravity_direction = -transform.basis.z
