extends Area3D

var max_speed = 40.0
var speed = 0.0
var acceleration = 1.8
var launched = false
var parent = null

@onready var particles = $GPUParticles3D

func _ready():
	monitoring = false
	particles.emitting = false

func launch(p):
	parent = p
	top_level = true
	launched = true
	monitoring = true
	particles.emitting = true
	
func _physics_process(delta):
	if not launched:
		return
	speed = lerpf(speed, max_speed, acceleration * delta)
	var velocity = -transform.basis.z * speed
	position += velocity * delta


func _on_body_entered(body):
	if body == parent:
		return
	launched = false
	$Explosion.activate()
	await get_tree().create_timer(0.5).timeout
	queue_free()
