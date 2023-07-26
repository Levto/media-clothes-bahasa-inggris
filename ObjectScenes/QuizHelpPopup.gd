extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	if Global.quizType == "QuizA":
		if Global.quizLimiter == 0:
			$Popup/VBoxContainer/Text.text = "1. Bacalah soal yang tersedia di atas layar.\n2.Carilah pakaian yang sesuai dengan soal.\n3. Klik tombol pakaian yang menurutmu sesuai.\n4. Tekan tombol [Submit] untuk memeriksa jawaban.\n5. Tekan tombol [Next] untuk melanjutkan \nke soal berikutnya.\n6. Kamu dapat melihat jumlah benar dan soal\nyang telah kamu jawab di sisi kiri layar." + "\n7. Tidak ada batas soal dalam quiz ini, selamat mengerjakan!" + "\nKlik untuk melanjutkan"
		else:
			$Popup/VBoxContainer/Text.text = "1. Bacalah soal yang tersedia di atas layar.\n2.Carilah pakaian yang sesuai dengan soal.\n3. Klik tombol pakaian yang menurutmu sesuai.\n4. Tekan tombol [Submit] untuk memeriksa jawaban.\n5. Tekan tombol [Next] untuk melanjutkan \nke soal berikutnya.\n6. Kamu dapat melihat jumlah benar dan soal\nyang telah kamu jawab di sisi kiri layar." + "\n7. Terdapat 10 soal dalam quiz ini, selamat mengerjakan!" + "\nKlik untuk melanjutkan"
	elif Global.quizType == "QuizB":
		if Global.quizLimiter == 0:
			$Popup/VBoxContainer/Text.text = "1. Bacalah soal yang tersedia di atas layar.\n2.Carilah pakaian yang sesuai dengan cuaca yang disebutkan.\n3. Klik tombol pakaian yang menurutmu sesuai.\n4. Tekan tombol [Submit] untuk memeriksa jawaban.\n5. Tekan tombol [Next] untuk melanjutkan \nke soal berikutnya.\n6. Kamu dapat melihat jumlah benar dan soal\nyang telah kamu jawab di sisi kiri layar." + "\n7. Tidak ada batas soal dalam quiz ini, selamat mengerjakan!" + "\nKlik untuk melanjutkan"
		else:
			$Popup/VBoxContainer/Text.text = "1. Bacalah soal yang tersedia di atas layar.\n2.Carilah pakaian yang sesuai dengan cuaca yang disebutkan.\n3. Klik tombol pakaian yang menurutmu sesuai.\n4. Tekan tombol [Submit] untuk memeriksa jawaban.\n5. Tekan tombol [Next] untuk melanjutkan \nke soal berikutnya.\n6. Kamu dapat melihat jumlah benar dan soal\nyang telah kamu jawab di sisi kiri layar." + "\n7. Terdapat 10 soal dalam quiz ini, selamat mengerjakan!" + "\nKlik untuk melanjutkan"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.quizType == "QuizB":
		get_parent().sunny.shuffle()
		get_parent().windyCloudy.shuffle()
		get_parent().rainy.shuffle()


func _on_Button_button_down():
	if Global.quizType == "QuizB":
		get_parent().rollQuiz()
	
	queue_free()
