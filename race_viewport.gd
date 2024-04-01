extends SubViewportContainer

@onready var chase_camera = $SubViewport/ChaseCamera
@onready var fixed_camera = $SubViewport/FixedCamera
@onready var speed_label = $SubViewport/HUD/MarginContainer/VBoxContainer/Speed
@onready var lap_counter = $SubViewport/HUD/MarginContainer/VBoxContainer/Lap
var target = null

func _process(delta):
	if target:
		speed_label.text = "%3.2f" % target.linear_velocity.length()
		lap_counter.text = str(target.lap_counter)
