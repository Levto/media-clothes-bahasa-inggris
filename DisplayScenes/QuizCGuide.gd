extends Control

var outOverlay = preload("res://ObjectScenes/OutOverlay.tscn")
var outOverlayInstance

var state = 0
onready var help = $VBoxContainer/Help
onready var list = $VBoxContainer/List
onready var shoppingList = $VBoxContainer/ShoppingList

onready var clothes = $VBoxContainer/ShoppingList/VBoxContainer/Clothes
onready var color = $VBoxContainer/ShoppingList/VBoxContainer2/Color
onready var size = $VBoxContainer/ShoppingList/VBoxContainer3/Size

func _ready():
	outOverlayInstance = outOverlay.instance()
	state = 0
	help.visible = true
	list.visible = false
	shoppingList.visible = false
	Global.quiz3List = []
	
func _process(delta):
	#randomize each array so each session will have different first question
	if state == 0:
		Global.quiz3Clothes.shuffle()
		Global.quiz3Color.shuffle()
		Global.quiz3Size.shuffle()
	
	

func _on_Next_button_down():
	if state == 0:
		state = 1
		help.visible = false
		list.visible = true
		shoppingList.visible = true
		
		#pick random number 0-2, then get array key for clothes
		var tempArray = Global.arrayRandomizer(3)
		var tempPicker = tempArray[0]
		Global.quiz3List.append(Global.quiz3Clothes[tempPicker])
		
		#pick random number 0-2, then get array key for color
		tempArray = Global.arrayRandomizer(3)
		tempPicker = tempArray[0]
		Global.quiz3List.append(Global.quiz3Color[tempPicker])
		
		#pick random number 0-2, then get array key for size
		tempArray = Global.arrayRandomizer(3)
		tempPicker = tempArray[0]
		Global.quiz3List.append(Global.quiz3Size[tempPicker])
		
		clothes.texture = load("res://Sprites/WardrobeButtons/" + Global.quiz3List[0] + ".png")
		color.texture = load("res://Sprites/QuizCNotes/" + Global.quiz3List[1] + ".png")
		size.texture = load("res://Sprites/QuizCNotes/" + Global.quiz3List[2] + ".png")
		
	else:
		Global.nextScene = "QuizC"
		add_child(outOverlayInstance)
