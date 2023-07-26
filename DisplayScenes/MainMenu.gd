extends Control

var outOverlay = preload("res://ObjectScenes/OutOverlay.tscn")
var outOverlayInstance


# Called when the node enters the scene tree for the first time.
func _ready():
	outOverlayInstance = outOverlay.instance()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WardrobeMenu_button_up():
	Global.nextScene = "WardrobeMenu"
	add_child(outOverlayInstance)

func _on_SubMenu_button_up():
	Global.nextScene = "SubMenu"
	add_child(outOverlayInstance)

func _on_Help_button_up():
	Global.nextScene = "Help"
	add_child(outOverlayInstance)

func _on_Quiz_button_up():
	Global.nextScene = "QuizMenu"
	add_child(outOverlayInstance)

func _on_About_button_up():
	Global.nextScene = "About"
	add_child(outOverlayInstance)
