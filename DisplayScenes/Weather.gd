extends Control

onready var weatherImage = $HBoxContainer/VBoxContainer/Weather
onready var english = $HBoxContainer/VBoxContainer/English
onready var indo = $HBoxContainer/VBoxContainer/Indo

onready var picture1 = $HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer/Picture1
onready var label1 = $HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer/Label1
onready var picture2 = $HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/Picture2
onready var label2 = $HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/Label2
onready var picture3 = $HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer3/Picture3
onready var label3 = $HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer3/Label3
onready var picture4 = $HBoxContainer/VBoxContainer2/HBoxContainer2/VBoxContainer/Picture4
onready var label4 = $HBoxContainer/VBoxContainer2/HBoxContainer2/VBoxContainer/Label4
onready var picture5 = $HBoxContainer/VBoxContainer2/HBoxContainer2/VBoxContainer2/Picture5
onready var label5 = $HBoxContainer/VBoxContainer2/HBoxContainer2/VBoxContainer2/Label5
onready var picture6 = $HBoxContainer/VBoxContainer2/HBoxContainer2/VBoxContainer3/Picture6
onready var label6 = $HBoxContainer/VBoxContainer2/HBoxContainer2/VBoxContainer3/Label6

# Called when the node enters the scene tree for the first time.
func _ready():
	weatherImage.texture = load("res://Sprites/Weather/" + Global.selectedWeather + ".png")
	english.text = Global.selectedWeather
	indo.text = Global.weatherDict[Global.selectedWeather].Translate
	
	label1.text = Global.weatherDict[Global.selectedWeather].One
	label2.text = Global.weatherDict[Global.selectedWeather].Two
	label3.text = Global.weatherDict[Global.selectedWeather].Three
	label4.text = Global.weatherDict[Global.selectedWeather].Four
	label5.text = Global.weatherDict[Global.selectedWeather].Five
	label6.text = Global.weatherDict[Global.selectedWeather].Six
	
	picture1.texture = load("res://Sprites/WardrobeButtons/" + label1.text + ".png")
	picture2.texture = load("res://Sprites/WardrobeButtons/" + label2.text + ".png")
	picture3.texture = load("res://Sprites/WardrobeButtons/" + label3.text + ".png")
	picture4.texture = load("res://Sprites/WardrobeButtons/" + label4.text + ".png")
	picture5.texture = load("res://Sprites/WardrobeButtons/" + label5.text + ".png")
	picture6.texture = load("res://Sprites/WardrobeButtons/" + label6.text + ".png")
	
	$HBoxContainer/VBoxContainer2/Line.text = "Example:\n" + Global.weatherDict[Global.selectedWeather].Line

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
