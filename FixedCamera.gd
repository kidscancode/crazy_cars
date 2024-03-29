extends Camera3D

@export var offset : Vector3 = Vector3(0, 0, 0)
@export var target : RigidBody3D

func _process(delta):
	if target:
		position = target.position + offset
	
