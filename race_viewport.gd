extends SubViewportContainer

@onready var chase_camera = $SubViewport/ChaseCamera
@onready var fixed_camera = $SubViewport/FixedCamera
@onready var label = $SubViewport/CanvasLayer/MarginContainer/Label

var target = null

func _process(delta):
	if target:
		label.text = "%3.2f" % target.linear_velocity.length()
