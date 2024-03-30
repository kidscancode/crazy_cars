extends Node3D

@export var rotate_speed = 0.0
@export var on_time = 1
@export var off_time = 1

var always_on = false

func _ready():
	if off_time == 0:
		always_on = true
		$Fire.emitting = true
	else:
		$OnTimer.wait_time = on_time
		$OffTimer.wait_time = off_time if off_time > 0 else 0.001
		$OnTimer.start()

func _on_off_timer_timeout():
	$Fire.emitting = true
	$Area3D.monitoring = true
	$OnTimer.start()

func _on_on_timer_timeout():
	$Fire.emitting = false
	$Area3D.monitoring = false
	$OffTimer.start()

func _process(delta):
	rotate_y(rotate_speed * delta)
	#if $RayCast3D.is_colliding() and (!$OnTimer.is_stopped() or always_on):
##		print("hit", $RayCast3D.get_collider().name)
		#$RayCast3D.get_collider().explode()


func _on_area_3d_body_entered(body):
		body.explode()
