extends Control

var outOverlay = preload("res://ObjectScenes/OutOverlay.tscn")
var outOverlayInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	outOverlayInstance = outOverlay.instance()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Sunny_button_down():
	Global.selectedWeather = "Sunny"
	Global.nextScene = "Weather"
	get_parent().add_child(outOverlayInstance)

func _on_Windy_button_down():
	Global.selectedWeather = "Windy"
	Global.nextScene = "Weather"
	get_parent().add_child(outOverlayInstance)

func _on_Cloudy_button_down():
	Global.selectedWeather = "Cloudy"
	Global.nextScene = "Weather"
	get_parent().add_child(outOverlayInstance)

func _on_Rainy_button_down():
	Global.selectedWeather = "Rainy"
	Global.nextScene = "Weather"
	get_parent().add_child(outOverlayInstance)
