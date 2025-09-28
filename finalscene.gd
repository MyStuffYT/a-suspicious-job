extends Control
var chara;
var prompts = [["", "BEEP..", true, false, false, 5], ["Max","How was the first day on the job?", false, true, ["You monster..", "I saw it."], 0], ["Max", "Heh, figuring out just now? You'll be just like them..", false, false, ["Not this time now..", "I set up a bomb.."],0], ["Max","I already know you set up a bomb.", false, false, ["turn the doorknob", "turn the doorknob"], 0], ["","*door locked*", false, false, false, 8], ["Max", "You really thought you'd escape.. give over the remote or you die.", false, false, false, 0], ["User", "Sacrifices must be made.. to stop your sadistic little killing spree..", false, false, false, 0], ["Max", "Wait what?", false, false, false, 0]]
# name | prompt | blackscreen | change character | answers | special action
var index = 0;
var unknown = preload("res://unknown.tscn")
var test = preload("res://known.tscn")
var typewriter = "";
var typedone = true;
var pressnow = false;
var answer = false;
var stage = 0;
const sceneother = preload("res://last.tscn")
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
	setp("", "")
	#setp("", "You're a university student in the middle of nowhere. You're just chilling, headphones in ears, hands to pockets, when suddenly someone taps on your shoulder.")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and typedone and not answer or pressnow:
		pressnow = false;
		if prompts.size() == index:
			print("oob, move on to stage 2")
			stage = 1;
		else:
			if prompts[index][2] == true:
				pass
			else:
				typedone = false;
				if prompts[index][3] != false :
					if has_node("character_thig"):
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
				if prompts[index][5] == 5:
					$beep.play()
				elif prompts[index][5] == 8:
					$doorknob.play()
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
	if typedone:
		answer = false;
		pressnow = true;


func _on_button_2_button_down() -> void:
	if typedone:
		answer = false;
		pressnow = true;
