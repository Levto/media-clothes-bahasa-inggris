extends Control

var outOverlay = preload("res://ObjectScenes/OutOverlay.tscn")
var outOverlayInstance


# Called when the node enters the scene tree for the first time.
func _ready():
	outOverlayInstance = outOverlay.instance()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Weather_button_down():
	Global.nextScene = "WeatherMenu"
	get_parent().add_child(outOverlayInstance)

func _on_Size_button_down():
	Global.nextScene = "Size"
	get_parent().add_child(outOverlayInstance)
