extends Area3D

@export var num = 1

func _ready():
	$MeshInstance3D.visible = Globals.debug
	
func _on_body_entered(body):
	print("player %s entered checkpoint %s" % [body.player_num, num])
	if not body.last_checkpoint:
		body.last_checkpoint = self
		body.lap_counter = 1
		return
	if num == 0 and body.last_checkpoint.num == Globals.checkpoint_count-1:
		body.lap_counter += 1
	body.last_checkpoint = self
	#if body.last_checkpoint.num >= num:
		#pass
	#else:
		#body.last_checkpoint = self
