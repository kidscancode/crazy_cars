extends CanvasLayer



@onready var message = $CenterContainer/Message

func _ready():
	message.text = ""
	message.modulate.a = 0
	
func show_message(icon):
	message.text = Globals.icons[icon]
	var tw = create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT).set_parallel(false)
	tw.tween_property(message, "modulate:a", 0.8, 1.0)
	tw.tween_property(message, "modulate:a", 0.0, 0.5)
