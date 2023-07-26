extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var selectedClothes = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.selectedClothes = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	selectedClothes = Global.selectedClothes
	if selectedClothes == "":
		$HBoxContainer/VBoxContainer2/HBoxContainer/Voice.visible = false
		$HBoxContainer/VBoxContainer2/Example.visible = false
	else:
		$HBoxContainer/VBoxContainer2/HBoxContainer/Voice.visible = true
		$HBoxContainer/VBoxContainer2/Example.visible = true
	
	if selectedClothes == "":
		$HBoxContainer/VBoxContainer2/BigSprite.texture = load("res://Sprites/Wardrobe/Empty.png")
	else:
		$HBoxContainer/VBoxContainer2/BigSprite.texture = load("res://Sprites/Wardrobe/" + selectedClothes + ".png")
	$HBoxContainer/VBoxContainer2/HBoxContainer/English.text = selectedClothes
	$HBoxContainer/VBoxContainer2/Indo.text = Global.clothesDictionary[selectedClothes]

	if selectedClothes == "Shoe" or selectedClothes == "Boots" or selectedClothes == "Flip Flops" or selectedClothes == "Socks" or selectedClothes == "Glasses":
		if selectedClothes == "Shoe":
			$HBoxContainer/VBoxContainer2/Example.text = "'I am wearing a pair of " + selectedClothes + "s'"
		else:
			$HBoxContainer/VBoxContainer2/Example.text = "'I am wearing a pair of " + selectedClothes + "'"
	else:
		if selectedClothes != "":
			$HBoxContainer/VBoxContainer2/Example.text = "'I am wearing a " + selectedClothes + "'"

func _on_Voice_button_down():
	$AudioStreamPlayer.stream = load("res://Audio/" + selectedClothes + ".wav")
	$AudioStreamPlayer.play()
