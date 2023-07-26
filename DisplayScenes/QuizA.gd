extends Control

var questionWord = ""
var questionArray = []
var correctAnswerCount = 0
var questionAnswered = 0

var quizResult = preload("res://ObjectScenes/QuizAResult.tscn")
var quizResultInstance

func _enter_tree():
	Global.quizType = "QuizA"

# Called when the node enters the scene tree for the first time.
func _ready():	
	Global.selectedAnswer = ""
	#setting the question
	#change this to tempArray in global to fully randomize it in process later
	questionArray = Global.clothesArray
	questionArray.shuffle()
	
	var tempArray = Global.arrayRandomizer(6)
	questionWord = questionArray[tempArray[0]]
	$VBoxContainer/Question.bbcode_text = "[center]Which one is A [color=yellow]" + questionWord + "[/color]?[/center]"
	
	#setting the answer options
	for node in get_tree().get_nodes_in_group("OptionButton"):
		node.answerOption = questionArray[node.uid]
		print(node.answerOption)
		
	$VBoxContainer/HBoxContainer3/ResultIcon.visible = false
	$HBoxContainer/Next.visible = false
	$VBoxContainer/HBoxContainer3/Result.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.selectedAnswer == "":
		$HBoxContainer/Submit.visible = false
	else:
		$HBoxContainer/Submit.visible = true
	
	questionArray.shuffle()
	
	$VBoxContainer2/CorrectAnswerCount.text = "Correct\nAnswers:\n" + str(correctAnswerCount) + "\nQuestions\nAnswered:\n" + str(questionAnswered)
	

func _on_Submit_button_down():
	questionAnswered += 1
	$VBoxContainer/HBoxContainer3/ResultIcon.visible = true
	$HBoxContainer/Next.visible = true
	$VBoxContainer/HBoxContainer3/Result.visible = true
	$HBoxContainer/Submit.visible = false
	if Global.selectedAnswer == questionWord:
		correctAnswerCount += 1
		$VBoxContainer/HBoxContainer3/ResultIcon.texture = load("res://PlacehoolderSprites/Answer_Correct.png")
		$VBoxContainer/HBoxContainer3/Result.text = "You are correct! It is a " + questionWord + "!"
		$VBoxContainer/HBoxContainer3/Result.get_font("font").outline_color = "58bc50"
	else:
		$VBoxContainer/HBoxContainer3/ResultIcon.texture = load("res://PlacehoolderSprites/Answer_Wrong.png")
		$VBoxContainer/HBoxContainer3/Result.text = "That doesn't seem like it! It is a " + Global.selectedAnswer + "!"
		$VBoxContainer/HBoxContainer3/Result.get_font("font").outline_color = "b54141"
	
	Global.selectedAnswer = ""
	
	#disable the buttons
	for node in get_tree().get_nodes_in_group("OptionButton"):
		node.disabled = true

func _on_Next_button_down():
	$VBoxContainer/HBoxContainer3/ResultIcon.visible = false
	$HBoxContainer/Next.visible = false
	$VBoxContainer/HBoxContainer3/Result.visible = false
	
	if questionAnswered == 10 and Global.quizLimiter == 1:
		Global.correctAnswer = correctAnswerCount
		quizResultInstance = quizResult.instance()
		add_child(quizResultInstance)
	else:
		var tempArray = Global.arrayRandomizer(6)
		questionWord = questionArray[tempArray[0]]
		$VBoxContainer/Question.bbcode_text = "[center]Which one is A [color=yellow]" + questionWord + "[/color]?[/center]"
	
		#setting the answer options
		for node in get_tree().get_nodes_in_group("OptionButton"):
			node.answerOption = questionArray[node.uid]
	
		#re-enable the buttons
		for node in get_tree().get_nodes_in_group("OptionButton"):
			node.disabled = false

func RetryQuiz():
	correctAnswerCount = 0
	questionAnswered = 0
	Global.selectedAnswer = ""
	var tempArray = Global.arrayRandomizer(6)
	questionWord = questionArray[tempArray[0]]
	$VBoxContainer/Question.bbcode_text = "[center]Which one is A [color=yellow]" + questionWord + "[/color]?[/center]"
	
	#setting the answer options
	for node in get_tree().get_nodes_in_group("OptionButton"):
		node.answerOption = questionArray[node.uid]
	
	#re-enable the buttons
	for node in get_tree().get_nodes_in_group("OptionButton"):
		node.disabled = false
