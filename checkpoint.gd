extends Area3D

@export var num = 1

func _ready():
	$MeshInstance3D.visible = Globals.debug
	
func _on_body_entered(body):
	print(body.name + " entered checkpoint " + str(num))
	if not body.last_checkpoint:
		body.last_checkpoint = self
		return
	if body.last_checkpoint.num >= num:
		print("Checkpoint out of order")
	else:
		print("setting checkpoint: " + str(num))
		body.last_checkpoint = self
