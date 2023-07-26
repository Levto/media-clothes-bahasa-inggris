extends Control

var outOverlay = preload("res://ObjectScenes/OutOverlay.tscn")
var outOverlayInstance

var score = 0

onready var next = $Next
onready var result1 = $Result1
onready var result2 = $Result2
onready var animationPlayer = $AnimationPlayer

#results 1 nodes
onready var taskClothesIcon = $Result1/Task/Clothes/ClothesIcon
onready var taskClothesName = $Result1/Task/Clothes/ClothesName
onready var taskColorIcon = $Result1/Task/Color/ColorIcon
onready var taskColorName = $Result1/Task/Color/ColorName
onready var taskSizeIcon = $Result1/Task/Size/SizeIcon
onready var taskSizeName = $Result1/Task/Size/SizeName

onready var boughtClothesIcon = $Result1/Bought/Clothes/ClothesIcon
onready var boughtClothesName = $Result1/Bought/Clothes/ClothesName
onready var boughtColorIcon = $Result1/Bought/Color/ColorIcon
onready var boughtColorName = $Result1/Bought/Color/ColorName
onready var boughtSizeIcon = $Result1/Bought/Size/SizeIcon
onready var boughtSizeName = $Result1/Bought/Size/SizeName

#result 2 nodes
onready var clothesResult = $Result2/HBoxContainer/ResultCheck/ClothesResult/ClothesResultIcon
onready var colorResult = $Result2/HBoxContainer/ResultCheck/ColorResult/ColorResultIcon
onready var sizeResult = $Result2/HBoxContainer/ResultCheck/SizeResult/SizeResultIcon
onready var quizRankIcon = $Result2/HBoxContainer/QuizRank/QuizRankIcon
onready var congratsText = $Result2/HBoxContainer/QuizRank/CongratsText


func _ready():
	animationPlayer.play("enter_scene")
	result1.visible = true
	result2.visible = false
	next.visible = false
	
	#setting scores and UI integration
	if Global.quiz3List[0] == Global.quiz3Answers[0]:
		score += 20
		clothesResult.texture = load("res://PlacehoolderSprites/Answer_Correct.png")
	else:
		clothesResult.texture = load("res://PlacehoolderSprites/Answer_Wrong.png")
	if Global.quiz3List[1] == Global.quiz3Answers[1]:
		score += 10
		colorResult.texture = load("res://PlacehoolderSprites/Answer_Correct.png")
	else:
		colorResult.texture = load("res://PlacehoolderSprites/Answer_Wrong.png")
	if Global.quiz3List[2] == Global.quiz3Answers[2]:
		score += 10
		sizeResult.texture = load("res://PlacehoolderSprites/Answer_Correct.png")
	else:
		sizeResult.texture = load("res://PlacehoolderSprites/Answer_Wrong.png")
	
	#setting up rank texture based on score
	if score == 40:
		quizRankIcon.texture = load("res://Sprites/RatingIcon/A.png")
		congratsText.text = "Good job! Keep it up!"
	elif score == 30:
		quizRankIcon.texture = load("res://Sprites/RatingIcon/B.png")
		congratsText.text = "Nice! Almost to the perfect score!"
	elif score == 20:
		quizRankIcon.texture = load("res://Sprites/RatingIcon/C.png")
		congratsText.text = "Try harder next time!"
	elif score == 10:
		quizRankIcon.texture = load("res://Sprites/RatingIcon/D.png")
		congratsText.text = "Maybe check the vocabulary list again?"
	elif score == 0:
		quizRankIcon.texture = load("res://Sprites/RatingIcon/E.png")
		congratsText.text = "You should check the vocabulary list again!"
	
	
	#setting stuffs to UIs
	taskClothesIcon.texture = load("res://Sprites/WardrobeButtons/" + Global.quiz3List[0] + ".png")
	taskClothesName.text = Global.quiz3List[0]
	taskColorIcon.texture = load("res://Sprites/QuizCNotes/" + Global.quiz3List[1] + ".png")
	taskColorName.text = Global.quiz3List[1]
	taskSizeIcon.texture = load("res://Sprites/QuizCNotes/" + Global.quiz3List[2] + ".png")
	taskSizeName.text = Global.quiz3List[2]
	
	boughtClothesIcon.texture = load("res://Sprites/WardrobeButtons/" + Global.quiz3Answers[0] + ".png")
	boughtClothesName.text = Global.quiz3Answers[0]
	boughtColorIcon.texture = load("res://Sprites/QuizCNotes/" + Global.quiz3Answers[1] + ".png")
	boughtColorName.text = Global.quiz3Answers[1]
	boughtSizeIcon.texture = load("res://Sprites/QuizCNotes/" + Global.quiz3Answers[2] + ".png")
	boughtSizeName.text = Global.quiz3Answers[2]
	
	
	
func _on_AnimationPlayer_animation_finished(anim_name):
	next.visible = true


func _on_Next_button_down():
	if result1.visible == true:
		result1.visible = false
		result2.visible = true
		next.visible = false
		animationPlayer.play("next")
	else:
		Global.nextScene = "QuizMenu"
		outOverlayInstance = outOverlay.instance()
		add_child(outOverlayInstance)
