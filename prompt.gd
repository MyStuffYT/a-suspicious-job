extends Control


func ntext(text: String) -> void:
	$name.set_text(text)


func ptext(text: String) -> void:
	$prompt.set_text(text)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
