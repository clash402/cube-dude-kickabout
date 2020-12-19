extends SpotLight

# PROPERTIES
const UP = Vector3(0, 1, 0)


# DEFAULTS
func _ready():
	reset()


# CUSTOM
func freeze(player_id):
	var player_1 = get_tree().get_root().find_node("Player1", true, false)
	var player_2 = get_tree().get_root().find_node("Player2", true, false)
	var target
	
	if player_id == 1:
		target = player_1.translation
	else:
		target = player_2.translation
	
	look_at(target, UP)
	show()


func reset():
	hide()
