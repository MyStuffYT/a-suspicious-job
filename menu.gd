extends Control

var scenee = preload("res://game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_2_button_down() -> void:
	# fix later
	#var tween = create_tween()
	#tween.set_trans(Tween.TRANS_LINEAR)
	#tween.set_ease(Tween.EASE_IN)
	#tween.tween_property($"../ColorRect", "modulate:a", 0.0, 1.0)
	get_tree().change_scene_to_packed(scenee)


func _on_texture_button_3_pressed() -> void:
	get_tree().quit()
