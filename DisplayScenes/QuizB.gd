extends Control

var quizResult = preload("res://ObjectScenes/QuizAResult.tscn")
var quizResultInstance

onready var option1 = $VBoxContainer/HBoxContainer/Option1
onready var option2 = $VBoxContainer/HBoxContainer/Option2
onready var option3 = $VBoxContainer/HBoxContainer/Option3

var questionWeather = ""
var optionsArray = []
var weatherArray = []

var correctAnswer = 0
var answeredQuestion = 0

var sunny = ["Shirt", "T-Shirt", "Shorts", "Dress", "Hat", "Trousers"]
var windyCloudy = ["Jacket", "Sweater", "Scarf", "Hat", "Jeans", "Trousers"]
var rainy = ["Raincoat", "Boots", "Flip Flops", "Jacket"]

var weatherDict = {
	"Shirt": ["Sunny", "Windy", "Cloudy"],
	"T-Shirt": ["Sunny", "Windy", "Cloudy"],
	"Shorts": ["Sunny"],
	"Dress": ["Sunny"],
	"Hat": ["Sunny", "Cloudy"],
	"Trousers": ["Sunny", "Cloudy", "Windy", "Rainy"],
	"Jacket": ["Windy", "Cloudy", "Rainy"],
	"Sweater": ["Windy", "Cloudy"],
	"Scarf": ["Windy", "Cloudy"],
	"Jeans": ["Windy", "Cloudy"],
	"Raincoat": ["Rainy"],
	"Boots": ["Rainy"],
	"Flip Flops": ["Sunny", "Rainy"]
}

func _enter_tree():
	Global.selectedAnswer = ""
	Global.quizType = "QuizB"

func _ready():
	quizResultInstance = quizResult.instance()
	$Results.visible = false
	rollQuiz()

func _process(delta):
	sunny.shuffle()
	windyCloudy.shuffle()
	rainy.shuffle()
	
	if Global.selectedAnswer == "":
		$VBoxContainer/HBoxContainer3/Submit.visible = false
	else:
		$VBoxContainer/HBoxContainer3/Submit.visible = true
	
	$Stats.text = "Correct Answers:\n" + str(correctAnswer) + "\nAnswered Questions:\n" + str(answeredQuestion)

func rollQuiz():
	optionsArray.clear()
	var tempClothes = ""
	tempClothes = sunny[0]
	optionsArray.append(tempClothes)
	tempClothes = windyCloudy[0]
	while tempClothes == optionsArray[0]:
		windyCloudy.shuffle()
		tempClothes = windyCloudy[0]
	optionsArray.append(tempClothes)
	tempClothes = rainy[0]
	while tempClothes == optionsArray[0] or tempClothes == optionsArray[1]:
		rainy.shuffle()
		tempClothes = rainy[0]
	optionsArray.append(tempClothes)
	optionsArray.shuffle()
	
	option1.answerOption = optionsArray[option1.uid]
	option2.answerOption = optionsArray[option2.uid]
	option3.answerOption = optionsArray[option3.uid]
	
	#randomize number 0-2 to pick random option for answer
	var tempRandomizer = Global.arrayRandomizer(3)
	
	#pick random weather based on picked clothes weather keys, return array
	var tempWeatherOptionsArray = weatherDict[optionsArray[tempRandomizer[0]]]
	#randomize the available weather array
	tempWeatherOptionsArray.shuffle()
	print(tempWeatherOptionsArray)
	#set question to the randomized weather available
	questionWeather = tempWeatherOptionsArray[0]
	$VBoxContainer/HBoxContainer2/VBoxContainer/Question.bbcode_text = "Which clothes do you wear in [color=yellow]" + questionWeather + "[/color] weather?"
	$VBoxContainer/HBoxContainer2/WeatherIcon.texture = load("res://Sprites/Weather/" + questionWeather + ".png")
	

func _on_Submit_button_down():
	$VBoxContainer/HBoxContainer3/Submit.visible = false
	$VBoxContainer/HBoxContainer3/Next.visible = true
	$Results.visible = true
	answeredQuestion += 1
	#check every available weather with the question
	var availableWeather = weatherDict[Global.selectedAnswer]
	for weather in availableWeather:
		if weather == questionWeather:
			correctAnswer += 1
			$VBoxContainer/HBoxContainer2/VBoxContainer/Question.bbcode_text = "Correct! " + Global.selectedAnswer + " is suitable for " + questionWeather + " weather."
			$Results.texture = load("res://PlacehoolderSprites/Answer_Correct.png")
			Global.selectedAnswer = ""
			return
		else:
			$VBoxContainer/HBoxContainer2/VBoxContainer/Question.bbcode_text = "Incorrect! " + Global.selectedAnswer + " is not suitable for " + questionWeather + " weather."
			$Results.texture = load("res://PlacehoolderSprites/Answer_Wrong.png")
	Global.selectedAnswer = ""
	
	
	
func RetryQuiz():
	correctAnswer = 0
	answeredQuestion = 0
	Global.selectedAnswer = ""
	rollQuiz()

func _on_Next_button_down():
	$VBoxContainer/HBoxContainer3/Submit.visible = true
	$VBoxContainer/HBoxContainer3/Next.visible = false
	$Results.visible = false
	Global.selectedAnswer = ""
	if answeredQuestion == 10 and Global.quizLimiter == 1:
		Global.correctAnswer = correctAnswer
		add_child(quizResultInstance)
	else:
		rollQuiz()
