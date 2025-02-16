extends CharacterBody3D

@export var speed: float = 8.0  # Increased speed
@export var jump_force: float = 5.0
@export var gravity: float = 9.8
@export var mouse_sensitivity: float = 0.003

var velocity_y: float = 0.0
var camera: Camera3D
var rotation_y: float = 0.0

func _ready():
	camera = $Camera3D  # Ensure you have a Camera3D as a child

func _input(event):
	if event is InputEventMouseMotion:
		rotation_y -= event.relative.x * mouse_sensitivity
		rotation.y = rotation_y  # Only rotate the player slightly
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, -0.5, 0.5)  # Prevent extreme up/down angles

func _physics_process(delta: float):
	var input_dir = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		input_dir.z -= 1
	if Input.is_action_pressed("move_back"):
		input_dir.z += 1
	if Input.is_action_pressed("move_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("move_right"):
		input_dir.x += 1
	
	input_dir = input_dir.normalized()
	input_dir = input_dir.rotated(Vector3.UP, rotation.y)  # Adjust direction based on camera
	
	# Apply gravity
	if not is_on_floor():
		velocity_y -= gravity * delta
	else:
		velocity_y = 0
		if Input.is_action_just_pressed("jump"):
			velocity_y = jump_force
	
	# Set movement direction
	var movement = input_dir * speed
	movement.y = velocity_y
	
	# Move character
	velocity = movement
	move_and_slide()

func _on_coin__collected() -> void:
	pass # Replace with function body.

func _on_coin_collected() -> void:
	pass # Replace with function body.
