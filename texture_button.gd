extends TextureButton
@onready var blackscreen: ColorRect = $"../ColorRect"
var scenee = preload("res://game.tscn").instantiate()

const test = preload("res://fixedbuttonlight.png")
const test1 = preload("res://fixedbutton.png")
var restart = true
func anim() -> void:
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", Vector2(30, 290), 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_down() -> void:
	# fix later
	#var tween = create_tween()
	#tween.set_trans(Tween.TRANS_LINEAR)
	#tween.set_ease(Tween.EASE_IN)
	#tween.tween_property($"../ColorRect", "modulate:a", 0.0, 1.0)
	get_tree().root.add_child(scenee)
	get_node("/root/main").queue_free()
