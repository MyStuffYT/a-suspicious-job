extends Control
var chara;
var prompts = [["Sketchy Alley", "3:30PM", true, false, false, 0], ["???", "Hey sir?", false, false, false, 0], ["???", "Hello?", false, false, false, 0], ["Max", "There you are!", false, true, false, 0], ["Max", "You look lost. Do you want a job?", false, false, ["Yes!","Why?"], 0], ["Max", "You'll get $15 an hour!", false, false, ["Deal.", "Okay."], 0], ["Max", "Let's go for it!", false, false, false, 1]]
# name | prompt | blackscreen | change character | answers
var index = 0;
var unknown = preload("res://unknown.tscn")
var test = preload("res://known.tscn")
var typewriter = "";
var typedone = true;
var pressnow = false;
var answer = false;
var stage = 0;
const sceneother = preload("res://game2.tscn")
@onready var click: AudioStreamPlayer = $click

func setp(name: String, prompt: String) -> void:
	$promptt/name.set_text(name)
	$promptt/prompt.set_text(prompt)
	
func enablec() -> void:
	$promptt/choices.visible = true;

func disablec() -> void:
	$promptt/choices.visible = false;

func setc(name: String, prompt: String) -> void:
	enablec()
	$promptt/choices/Button.set_text(name)
	$promptt/choices/Button2.set_text(prompt)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setp("", "You're a university student in the middle of nowhere. You're just chilling, headphones in ears, hands to pockets, when suddenly someone taps on your shoulder.")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and typedone and not answer or pressnow:
		print("done")
		pressnow = false;
		if prompts.size() == index:
			print("oob, move on to stage 1")
			stage = 1;
		else:
			if prompts[index][2] == true:
				pass
			else:
				typedone = false;
				if prompts[index][3] != false :
					get_node("characterthig").free()
					await get_tree().process_frame
				if prompts[index][0] == "???" and not has_node("characterthig"):
					chara = unknown.instantiate()
				elif prompts[index][0] == "Max" and not has_node("characterthig"):
					chara = test.instantiate()
				elif not has_node("characterthig"):
					chara = unknown.instantiate()
				if not has_node("characterthig"):
					self.add_child(chara)
				$TextureRect/ColorRect.visible = false;
				if prompts[index][4] is bool:
					disablec()
				else:
					setc(prompts[index][4][0], prompts[index][4][1])
					answer = true;
			setp(prompts[index][0], "")
			typewriter = ""
			for letter in prompts[index][1]:
				typewriter += letter
				click.play()
				await get_tree().create_timer(0.05).timeout
				setp(prompts[index][0], typewriter)
			setp(prompts[index][0], prompts[index][1])
			typedone = true;
			print(prompts.size())
			index += 1
			print(index)
	if stage == 1:
		get_tree().change_scene_to_packed(sceneother)

func _on_button_button_down() -> void:
	answer = false;
	pressnow = true;


func _on_button_2_button_down() -> void:
	answer = false;
	pressnow = true;
