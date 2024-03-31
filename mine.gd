extends Area3D

func _ready():
	await get_tree().create_timer(0.5).timeout
	monitoring = true

func _on_body_entered(body):
	body.explode()
	queue_free()
