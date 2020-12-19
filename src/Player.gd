extends KinematicBody

# PROPERTIES
export var player_id = 1

onready var anim_player = $AnimationPlayer
onready var particles = $Particles
onready var spawn_pos = get_tree().get_root().find_node("SpawnPlayer%s" % player_id, true, false)

const UP = Vector3(0, 1, 0)
const SPEED = 10

var velocity = Vector3()
var can_move = true


# DEFAULTS
func _physics_process(delta):
	face_forward()
	move()
	animate()


# CUSTOM
func face_forward():
	var facing_dir = Vector3(-velocity.x, 0, -velocity.z)
	if not velocity.x == 0 or not velocity.z == 0:
		if can_move:
			look_at(facing_dir * SPEED, UP)


func move():
	var x = Input.get_action_strength("move_right_%s" % player_id) - Input.get_action_strength("move_left_%s" % player_id)
	var z = Input.get_action_strength("move_down_%s" % player_id) - Input.get_action_strength("move_up_%s" % player_id)
	velocity = Vector3(x, 0, z)
	if can_move:
		move_and_slide(velocity.normalized() * SPEED, UP)


func animate():
	if velocity.length() > 0 and can_move:
		anim_player.play("arms-cross-walk")
	else:
		anim_player.stop()


func freeze(id):
	can_move = false
	if id == player_id:
		particles.emitting = true


func reset():
	translation = spawn_pos.translation
	can_move = true
