extends Spatial


var rotation_speed = PI/2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input_keyboard(delta):
	var y_rotation = 0
	if Input.is_action_pressed("cam_right"):
		y_rotation += 1
	if Input.is_action_pressed("cam_left"):
		y_rotation += -1
	global_rotate(Vector3.UP, y_rotation * rotation_speed * delta)
	
	var x_rotation = 0
	if Input.is_action_pressed("cam_up"):
		if $Rotacion.get_rotation().x > -1.5:
			x_rotation += -1
	if Input.is_action_pressed("cam_down"):
		if $Rotacion.get_rotation().x < 1.5:
			x_rotation += 1
	$Rotacion.rotate(Vector3.RIGHT, x_rotation * rotation_speed * delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input_keyboard(delta)
