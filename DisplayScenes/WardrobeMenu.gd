extends Control

var outOverlay = preload("res://ObjectScenes/OutOverlay.tscn")
var outOverlayInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	outOverlayInstance = outOverlay.instance()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Top_button_down():
	Global.nextScene = "Top"
	get_parent().add_child(outOverlayInstance)


func _on_Bottom_button_down():
	Global.nextScene = "Bottom"
	get_parent().add_child(outOverlayInstance)


func _on_Accessory_button_down():
	Global.nextScene = "Accessory"
	get_parent().add_child(outOverlayInstance)

