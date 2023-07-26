extends Control

export(ButtonGroup) var answerButtons

var outOverlay = preload("res://ObjectScenes/OutOverlay.tscn")
var outOverlayInstance

var note = preload("res://ObjectScenes/Note.tscn")
var noteInstance 

var state = 0
var timer = 0
var timerStart = 0

onready var salesText = $VBoxContainer/HBoxContainer/VBoxContainer/SalesText
onready var dialogue = $VBoxContainer/HBoxContainer/VBoxContainer/Dialogue
onready var next = $VBoxContainer/Next

onready var qna = $VBoxContainer/QnA
onready var question = $VBoxContainer/QnA/Question
onready var optionA = $VBoxContainer/QnA/Answers/OptionA
onready var optionB = $VBoxContainer/QnA/Answers/OptionB
onready var optionC = $VBoxContainer/QnA/Answers/OptionC

onready var sales = $Sales

func _ready():
	Global.quiz3Answers = []
	state = 0
	timerStart = 1
	salesText.visible = false
	dialogue.visible = false
	qna.visible = false
	next.visible = false
	sales.animation = "idle"
	#connect button group with this node
	
	for i in answerButtons.get_buttons():
		i.connect("button_down", self, "answerPressed")
	
func _process(delta):
	
	if timerStart == 1:
		timer += 100 * delta
	
	if state == 0 and timer >= 100: #enter scene, start of sequence, welcoming user
		timer = 0
		sales.animation = "welcome"
		salesText.visible = true
		state += 1
	elif state == 1 and timer >= 200: #showing first question and answers
		timerStart = 0
		timer = 0
		qna.visible = true
		#setting texts
		question.text = "I'm looking for a ..."
		optionA.text = Global.quiz3Clothes[0]
		optionB.text = Global.quiz3Clothes[1]
		optionC.text = Global.quiz3Clothes[2]
	elif state == 2 and timer >= 200: #after answering question and waiting for 2 seconds
		timer = 0
		dialogue.visible = false
		sales.animation = "normal"
		salesText.text = "What color do you want for your " + Global.quiz3Answers[0] + "?"
		state += 1
	elif state == 3 and timer >= 200: #second question
		timerStart = 0
		timer = 0
		qna.visible = true
		#setting texts
		question.text = "The color is ..."
		optionA.text = Global.quiz3Color[0]
		optionB.text = Global.quiz3Color[1]
		optionC.text = Global.quiz3Color[2]
	elif state == 4 and timer >= 200: #after answering 2nd question
		timer = 0
		dialogue.visible = false
		sales.animation = "normal"
		salesText.text = "How about the size?"
		state += 1
	elif state == 5 and timer >= 200:
		timerStart = 0
		timer = 0
		qna.visible = true
		#setting texts
		question.text = "The size is ..."
		optionA.text = Global.quiz3Size[0]
		optionB.text = Global.quiz3Size[1]
		optionC.text = Global.quiz3Size[2]
	elif state == 6 and timer >= 200:
		timer = 0
		dialogue.visible = false
		sales.animation = "normal"
		salesText.text = "Ok, so your order is one " + Global.quiz3Answers[2] + " " + Global.quiz3Answers[1] + " " + Global.quiz3Answers[0] + "."
		state += 1
	elif state == 7 and timer >= 400:
		timer = 0
		dialogue.visible = false
		sales.animation = "welcome"
		salesText.text = "You may try the clothes first in the changing room."
		state += 1
	elif state == 8 and timer >= 300:
		timerStart = 0
		timer = 0
		dialogue.visible = false
		sales.animation = "thanks"
		salesText.text = "Thanks for shopping here!"
		next.visible = true
func answerPressed():
	if state == 1:
		Global.quiz3Answers.append(answerButtons.get_pressed_button().text) #get text from pressed button
		dialogue.text = "Yes please, I'm looking for a " + Global.quiz3Answers[0]
		qna.visible = false
		dialogue.visible = true
		state += 1
		timerStart = 1
	elif state == 3:
		Global.quiz3Answers.append(answerButtons.get_pressed_button().text)
		dialogue.text = Global.quiz3Answers[1] + " one please"
		qna.visible = false
		dialogue.visible = true
		sales.animation = "idle"
		state += 1
		timerStart = 1
	elif state == 5:
		Global.quiz3Answers.append(answerButtons.get_pressed_button().text)
		dialogue.text = Global.quiz3Answers[2] + " one please"
		qna.visible = false
		dialogue.visible = true
		sales.animation = "idle"
		state += 1
		timerStart = 1


func _on_TextureButton_button_down():
	noteInstance = note.instance()
	add_child(noteInstance)


func _on_Next_button_down():
	Global.nextScene = "QuizCResult"
	outOverlayInstance = outOverlay.instance()
	add_child(outOverlayInstance)
