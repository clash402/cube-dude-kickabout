extends DirectionalLight

# DEFAULTS
func _ready():
	reset()


# CUSTOM
func freeze(player_id):
	hide()


func reset():
	show()
