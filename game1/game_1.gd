extends Control
var secret_number: int
var attempts_left: int = 7
@onready var input_field: LineEdit = %Input
@onready var feedback_label: Label = %sealed

func _ready():
	randomize()  # Essential for different numbers each game
	secret_number = randi() % 100 + 1
	feedback_label.text = "Guess a number between 1 and 100!"

func _on_guess_button_pressed():
	var guess = int(input_field.text)
	
	if guess == secret_number:
		feedback_label.text = "🎉 You won! The number was " + str(secret_number)
	elif guess < secret_number:
		feedback_label.text = "📈 Too low! Try higher."
		attempts_left -= 1
	else:
		feedback_label.text = "📉 Too high! Try lower."
		attempts_left -= 1
	
	if attempts_left == 0 and guess != secret_number:
		feedback_label.text = "💀 Game Over! Number was " + str(secret_number)
	
	input_field.clear()
