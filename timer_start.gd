extends Label

var time_left: int = 60  # Start time in seconds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_timer_display()
	$Timer.start()  # Ensure Timer is set to Autostart in the editor

# Function to update the timer display
func update_timer_display() -> void:
	text = "%02d:%02d" % [time_left / 60, time_left % 60]

# Called when the timer reaches its timeout
func _on_timer_timeout() -> void:
	if time_left > 0:
		time_left -= 1
		update_timer_display()

		if time_left == 0:
			get_tree().change_scene_to_file("res://game_over.tscn")
