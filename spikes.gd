extends Node3D

@export var initial_delay = 5.0
@export var delay = 5.0

func _ready():
	await get_tree().create_timer(initial_delay).timeout
	$Timer.wait_time = delay
	$Timer.start()

func _on_area_3d_body_entered(body):
	body.explode()


func _on_timer_timeout():
	$AnimationPlayer.play("move")
