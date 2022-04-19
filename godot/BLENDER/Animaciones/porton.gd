extends Spatial


func _ready():
	pass

func get_input_keyboard(delta):
	if Input.is_action_pressed("porton"):
		$Porton.get_node("AnimationPlayer").play("PortonAction.001")

func _process(delta):
	get_input_keyboard(delta)
