extends TextureRect

var offset = Vector2()

func _get_drag_data(at_position: Vector2) -> TextureRect: # replace TextureRect with whatever this object extends
	offset = get_local_mouse_position()
	return self

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	position = get_global_mouse_position() - offset
	print(position)
	return true

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y > 500 and position.x < 300:
		if Input.is_action_just_released("mousebuttonl"):
			self.queue_free()
