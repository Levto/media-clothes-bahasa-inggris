extends VBoxContainer

onready var button = $Button
export (int) var uid
var answerOption = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if answerOption == Global.selectedAnswer:
		button.texture_normal = load("res://Sprites/WardrobeButtons/" + answerOption + "Selected.png")
		button.texture_pressed = load("res://Sprites/WardrobeButtons/" + answerOption + "Selected.png")
		button.texture_hover =  load("res://Sprites/WardrobeButtons/" + answerOption + "Selected.png")
	else:
		button.texture_normal = load("res://Sprites/WardrobeButtons/" + answerOption + ".png")
		button.texture_pressed = load("res://Sprites/WardrobeButtons/" + answerOption + ".png")
		button.texture_hover =  load("res://Sprites/WardrobeButtons/" + answerOption + "Hover.png")
	$Label.text = answerOption

func _on_Button_button_down():
	Global.selectedAnswer = answerOption
