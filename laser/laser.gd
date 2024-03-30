extends Node3D

@export var fire_rate = 3.0

func _ready():
	$Timer.wait_time = fire_rate
	$Timer.start()


func _on_timer_timeout():
	$Pulse.restart()
	$AnimationPlayer.play("fire")


func _on_area_3d_body_entered(body):
	body.explode()
