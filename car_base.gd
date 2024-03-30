# body_mesh.set_surface_override_material() 0 (shell) 2 (body)
extends RigidBody3D

var sphere_offset = Vector3.DOWN
@export var acceleration = 35.0
@export var steering = 19.0
@export var turn_speed = 4.0
@export var turn_stop_limit = 0.75
@export var body_tilt = 35

var speed_input = 0
var turn_input = 0
var facing
var last_checkpoint = null
var teleport_position = null
var block_input = false
var held_powerup = null

@onready var car_mesh = $CarMesh
@onready var body = $CarMesh/suv/suv
@onready var body_mesh = $CarMesh/suv/suv/body
@onready var ground_ray = $CarMesh/GroundRay

@onready var right_wheel = $CarMesh/suv/suv/wheel_frontRight
@onready var left_wheel = $CarMesh/suv/suv/wheel_frontLeft
@onready var explosion = $Explosion

func _ready():
	car_mesh.top_level = true
	
func _physics_process(delta):
	facing = linear_velocity.normalized().dot(-car_mesh.global_transform.basis.z)
	car_mesh.position = position + sphere_offset
	if ground_ray.is_colliding():
		linear_damp = 1
		apply_central_force(-car_mesh.global_transform.basis.z * speed_input)
	else:
		linear_damp = 1

func _integrate_forces(state):
	if teleport_position:
		state.transform = teleport_position.global_transform
		car_mesh.global_transform = teleport_position.global_transform
		print("teleporting to %v" % teleport_position.global_position)
		print("%v" % global_position)
		state.linear_velocity = Vector3.ZERO
		teleport_position = null
	
func get_input():
	#if block_input:
		#speed_input = 0
		#turn_input = 0
		#return
	speed_input = Input.get_axis("brake", "accelerate") * acceleration
	turn_input = Input.get_axis("steer_right", "steer_left") * deg_to_rad(steering)
	
func _process(delta):
	if not ground_ray.is_colliding():
		return
	get_input()
	right_wheel.rotation.y = turn_input
	left_wheel.rotation.y = turn_input
	
	if linear_velocity.length() > turn_stop_limit:
		$CarMesh/SmokeL.emitting = abs(turn_input) > 0.1
		$CarMesh/SmokeR.emitting = abs(turn_input) > 0.1
		var new_basis = car_mesh.global_transform.basis.rotated(car_mesh.global_transform.basis.y, turn_input * sign(speed_input))
		car_mesh.global_transform.basis = car_mesh.global_transform.basis.slerp(new_basis, turn_speed * delta)
		car_mesh.global_transform = car_mesh.global_transform.orthonormalized()
		# tilt
		var t = -turn_input * linear_velocity.length() / body_tilt
		body.rotation.z = lerp(body.rotation.z, t, 5.0 * delta)
	if ground_ray.is_colliding():
		var n = ground_ray.get_collision_normal()
		var xform = align_with_y(car_mesh.global_transform, n)
		car_mesh.global_transform = car_mesh.global_transform.interpolate_with(xform, 10.0 * delta)

func align_with_y(xform, new_y):
	xform.basis.y = new_y
	xform.basis.x = -xform.basis.z.cross(new_y)
#	xform.basis = xform.basis.orthonormalized()
	return xform.orthonormalized()
	
func explode():
	freeze = true
	car_mesh.hide()
	explosion.activate()
	#block_input = true
	await get_tree().create_timer(2.0).timeout
	teleport_position = last_checkpoint
	print("exploded - teleporting to " + last_checkpoint.name)
	car_mesh.show()
	#block_input = false
	freeze = false
