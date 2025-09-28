extends AudioStreamPlayer
@onready var label: Label = $"../Label"
var main = preload("res://main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.play()
	await get_tree().create_timer(4).timeout
	label.visible = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
