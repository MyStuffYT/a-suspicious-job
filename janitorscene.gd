extends Control
@onready var control: Control = $Control

var restart = true;
var trashvalue = 0;
var prompt = preload("res://prompt.tscn")
var sceneother = preload("res://finalscene.tscn")
@onready var monsterlabel: Label = $monsterlabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func promptstart() -> void:
	monsterlabel.visible = true;
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_packed(sceneother)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if restart:
		trashvalue = 0;
		for trash in control.get_children():
			if "paper" in trash.name:
				trashvalue += 1;
		if trashvalue == 0:
			print("trash is not there")
			promptstart()
			restart = false;
			
