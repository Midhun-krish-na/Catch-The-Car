extends VehicleBody3D

const steer = 0.5
const eng_pow = 300
var velocity = Vector2.ZERO

@onready var camera_control: Node3D = $CameraControl
@onready var camera_3d: Camera3D = $CameraControl/Camera3D

func _input(event):
	if event.is_action_pressed("Exit"):
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#The calculation of steering Value
	steering = move_toward(steering, Input.get_axis("Right","Left") * steer, delta * 2.0)
	
	#The calculation of engine_force based on user input
	engine_force = Input.get_axis("Dec","Acc") * eng_pow
	
