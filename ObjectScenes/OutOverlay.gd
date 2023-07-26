extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	animation = "entry"
	frame = 0
	playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OutOverlay_animation_finished():
	get_tree().change_scene("res://DisplayScenes/" + Global.nextScene + ".tscn")
	queue_free()
