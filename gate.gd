extends Area3D

@export var target : Area3D

@onready var portal = $MeshInstance3D

func _ready():
	if !target:
		$MeshInstance3D.hide()

func _on_body_entered(body):
	if !target:
		return
	body.teleport_position = target.portal
