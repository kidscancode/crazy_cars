extends Area3D

func _ready():
	var tw = create_tween().set_loops().set_parallel(false).set_trans(Tween.TRANS_SINE)
	tw.tween_property($PropBlockQuestionMark, "position:y", 1.0, 1.0)
	tw.tween_property($PropBlockQuestionMark, "position:y", 0.5, 1.0)

func _process(delta):
	rotation.y += PI/2 * delta

func _on_body_entered(body):
	queue_free()
