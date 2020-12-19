extends Spatial

# PROPERTIES
export var target_score = 3

onready var airhorn_sfx = $SFX/AirhornSFX
onready var hud = $HUD
onready var timer = $Timer

var player_1_score = 0
var player_2_score = 0


# SIGNALS
func _on_GoalDetector_body_entered(body, goal_id):
	update_score(goal_id)
	get_tree().call_group("players", "freeze", goal_id)
	get_tree().call_group("ball", "freeze")
	get_tree().call_group("lights", "freeze", goal_id)
	airhorn_sfx.play()
	timer.start()


func _on_Timer_timeout():
	reset()


# CUSTOM
func update_score(player_id):
	var new_score
	match player_id:
		1:
			player_1_score += 1
			new_score = player_1_score
		2:
			player_2_score += 1
			new_score = player_2_score
	hud.update_score(player_id, new_score)
	game_is_over(player_id, new_score)


func reset():
	get_tree().call_group("players", "reset")
	get_tree().call_group("ball", "reset")
	get_tree().call_group("lights", "reset")


func game_is_over(player_id, score):
	if score == target_score:
		timer.queue_free()
		hud.end_game(player_id)


