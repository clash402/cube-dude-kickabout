extends CanvasLayer

# PROPERTIES
onready var popup = $Popup
onready var popup_lbl = $Popup/NinePatchRect/Margin/VBox/Label


# DEFAULTS
func _ready():
#	popup.popup_centered()
	pass


# SIGNALS
func _on_Button_pressed():
	get_tree().reload_current_scene()


# CUSTOM
func update_score(player_id, score):
	var score_lbl = get_node("Margin/HBox/VBox/Banner/Margin/HBox/P%sScore" % player_id)
	score_lbl.text = str(score)


func end_game(player_id):
	popup_lbl.text = "Player " + str(player_id) + " wins!"
	popup.popup_centered()
