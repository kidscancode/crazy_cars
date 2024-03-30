extends GPUParticles3D

func activate():
	$MeshInstance3D.show()
	emitting = true
	await get_tree().create_timer(0.5).timeout
	$MeshInstance3D.hide()
