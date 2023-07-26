extends Control


func _ready():
	$AnimationPlayer.play("entry")
	$TextureRect/HBoxContainer/VBoxContainer/Clothes.texture = load("res://Sprites/WardrobeButtons/" + Global.quiz3List[0] + ".png")
	$TextureRect/HBoxContainer/VBoxContainer2/Color.texture = load("res://Sprites/QuizCNotes/" + Global.quiz3List[1] + ".png")
	$TextureRect/HBoxContainer/VBoxContainer3/Size.texture = load("res://Sprites/QuizCNotes/" + Global.quiz3List[2] + ".png")


func _on_Button_button_down():
	$AnimationPlayer.play("exit")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "exit":
		queue_free()
