extends Area3D

signal coinCollected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotate_y(deg_to_rad(3))

func _on__coin_body_entered(body: Node3D) -> void:
	if body.name == "Steve":
		$Timer.start()
		

func _on_timer_timeout() -> void:
	emit_signal("coinCollected")
	queue_free()
