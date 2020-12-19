extends RigidBody

# PROPERTIES
onready var kick_sfx = $KickSFX
onready var spawn_pos = get_tree().get_root().find_node("SpawnBall", true, false)


# SIGNALS
func _on_body_entered(body):
	if body is KinematicBody and not kick_sfx.is_playing():
		kick_sfx.play()


# CUSTOM
func freeze():
	axis_lock_linear_x = true
	axis_lock_linear_y = true
	axis_lock_linear_z = true


func reset():
	axis_lock_linear_x = false
	axis_lock_linear_y = false
	axis_lock_linear_z = false
	translation = spawn_pos.translation
