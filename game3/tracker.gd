extends Control

var counter: int = 0
@onready var counter_label: Label = %CounterLabel

func _ready():
	update_display()

func _on_add_button_pressed():
	counter += 1
	update_display()

func _on_subtract_button_pressed():
	counter -= 1
	update_display()

func _on_reset_button_pressed():
	counter = 0
	update_display()

func update_display():
	counter_label.text = "Count: " + str(counter)
