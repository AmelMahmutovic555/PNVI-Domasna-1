extends Label

var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(coins)

func _on_coin_collected():
	coins = coins + 1
	_ready()
	if coins == 20:
		$Timer.start()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://you_win.tscn")
