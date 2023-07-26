extends Control

var outOverlay = preload("res://ObjectScenes/OutOverlay.tscn")
var outOverlayInstance


# Called when the node enters the scene tree for the first time.
func _ready():
	outOverlayInstance = outOverlay.instance()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.clothesArray.shuffle()
	if Global.quizLimiter == 1:
		$Limiter.text = "Batasi Jumlah Pertanyaan: ON"
	else:
		$Limiter.text = "Batasi Jumlah Pertanyaan: OFF"

func _on_QuizA_button_down():
	Global.nextScene = "QuizA"
	add_child(outOverlayInstance)


func _on_Limiter_button_down():
	if Global.quizLimiter == 1:
		Global.quizLimiter = 0
	else:
		Global.quizLimiter = 1


func _on_QuizB_button_down():
	Global.nextScene = "QuizB"
	add_child(outOverlayInstance)


func _on_QuizC_button_down():
	Global.nextScene = "QuizCGuide"
	add_child(outOverlayInstance)
