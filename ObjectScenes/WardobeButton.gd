extends TextureButton

export (String) var clothes = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texture_normal = load("res://Sprites/WardrobeButtons/" + clothes + ".png")
	texture_hover = load("res://Sprites/WardrobeButtons/" + clothes + "Hover.png")
	texture_pressed = load("res://Sprites/WardrobeButtons/" + clothes + ".png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WardobeButton_button_down():
	Global.selectedClothes = clothes
