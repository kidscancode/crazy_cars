extends Node3D

@export var speed = 1.0

func _ready():
	$AnimationPlayer.speed_scale = speed
