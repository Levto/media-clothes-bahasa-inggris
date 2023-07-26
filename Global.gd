extends Node

var nextScene = ""

var selectedClothes = ""

var tempArrayPlaceholder = []

var selectedAnswer = ""

var quizLimiter = 1
var correctAnswer = 0

var quizType = ""

var clothesDictionary = {
	"": "",
	"Shirt": "Kemeja",
	"T-Shirt": "Kaos",
	"Dress": "Gaun",
	"Sweater": "Baju Hangat",
	"Jacket": "Jaket",
	"Raincoat": "Jas Hujan",
	"Pajama": "Piyama/Baju Tidur",
	"Uniform Shirt": "Kemeja Seragam",
	"Blouse": "Blus/Kemeja Wanita",
	#########
	"Skirt": "Rok",
	"Shorts": "Celana Pendek",
	"Trousers": "Celana Panjang",
	"Jeans": "Celana Jeans/Denim",
	"Socks": "Kaos Kaki",
	"Shoe": "Sepatu",
	"Boots": "Sepatu Boots",
	"Flip Flops": "Sendal Jepit",
	##########
	"Glasses": "Kacamata",
	"Scarf": "Syal",
	"Belt": "Ikat Pinggang",
	"Tie": "Dasi",
	"Hat": "Topi",
	"Necklace": "Kalung",
	"Ring": "Cincin",
	"Bracelet": "Gelang"
}

var selectedWeather = ""

var weatherDict = {
	"": {
		"Translate": "",
		"One": "",
		"Two": "",
		"Three": "",
		"Four": "",
		"Five": "",
		"Six": "",
		"Line": "I usually wear in day"
	},
	"Sunny": {
		"Translate": "Cerah",
		"One": "Shirt",
		"Two": "T-Shirt",
		"Three": "Dress",
		"Four": "Shorts",
		"Five": "Trousers",
		"Six": "Hat",
		"Line": "I usually wear T-Shirt in Sunny day"
	},
	"Windy": {
		"Translate": "Berangin",
		"One": "Sweater",
		"Two": "Scarf",
		"Three": "Jacket",
		"Four": "Jeans",
		"Five": "Trousers",
		"Six": "",
		"Line": "I usually wear Sweater in Windy day"
	},
	"Cloudy": {
		"Translate": "Berawan",
		"One": "Jacket",
		"Two": "Hat",
		"Three": "Scarf",
		"Four": "Jeans",
		"Five": "Trousers",
		"Six": "Sweater",
		"Line": "I usually wear Jacket in Cloudy day"
	},
	"Rainy": {
		"Translate": "Hujan",
		"One": "Raincoat",
		"Two": "Jacket",
		"Three": "Flip Flops",
		"Four": "Boots",
		"Five": "",
		"Six": "",
		"Line": "I usually wear Raincoat in Rainy day"
	}
}

var clothesArray = ["T-Shirt", "Shirt", "Dress", "Sweater", "Pajama", "Jacket", "Uniform Shirt", "Raincoat", "Skirt", "Shorts", "Trousers", "Jeans", "Socks", "Shoe", "Boots", "Flip Flops", "Glasses", "Scarf", "Belt", "Hat", "Bracelet", "Necklace", "Ring", "Tie"]

#arrays for quiz 3
var quiz3Clothes = ["T-Shirt", "Shirt", "Dress", "Sweater", "Pajama", "Jacket", "Raincoat", "Skirt", "Shorts", "Trousers"]
var quiz3Color = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "White"]
var quiz3Size = ["Small", "Medium", "Large", "Extra Large"]

var quiz3List = []
var quiz3Answers = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func arrayRandomizer(var size):
	var returnArray = []
	
	for i in range(0,size):
		returnArray.append(i)
	returnArray.shuffle()
	
	return returnArray
