extends Control


var outOverlay = preload("res://ObjectScenes/OutOverlay.tscn")
var outOverlayInstance


# Called when the node enters the scene tree for the first time.
func _ready():
	outOverlayInstance = outOverlay.instance()
	$Popup/VBoxContainer/Score.text = str(Global.correctAnswer * 10)
	$Popup/VBoxContainer/Statistic.text = "Jumlah Benar: " + str(Global.correctAnswer) + "\nJumlah Salah: " + str(10 - Global.correctAnswer) + "\n"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_button_down():
	Global.nextScene = "QuizMenu"
	add_child(outOverlayInstance)


func _on_Retry_button_down():
	get_parent().RetryQuiz()
	queue_free()
