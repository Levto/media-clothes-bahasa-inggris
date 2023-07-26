extends TextureButton

export (int) var uid
var answerOption = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if answerOption == Global.selectedAnswer:
		texture_normal = load("res://Sprites/WardrobeButtons/" + answerOption + "Selected.png")
		texture_pressed = load("res://Sprites/WardrobeButtons/" + answerOption + "Selected.png")
		texture_hover =  load("res://Sprites/WardrobeButtons/" + answerOption + "Selected.png")
	else:
		texture_normal = load("res://Sprites/WardrobeButtons/" + answerOption + ".png")
		texture_pressed = load("res://Sprites/WardrobeButtons/" + answerOption + ".png")
		texture_hover =  load("res://Sprites/WardrobeButtons/" + answerOption + "Hover.png")

func _on_Option1_button_down():
	Global.selectedAnswer = answerOption
	print("selected answer is " + Global.selectedAnswer)
