extends Control

@export var num_buttons: int = 5
@onready var vbox: VBoxContainer = %VBoxContainer
@onready var start: Button = %start

func _ready():
	print("I am ready")

func _on_button_press():
	print("I am entering")
	for i in range(num_buttons):
		var btn = Button.new()
		btn.pressed.connect(_on_dynamic_button_pressed.bind(i + 1))
		btn.text = "Button %d" % (i + 1)
		btn.position = Vector2(10, 40 * i)  # If manually setting position (useful outside containers)
		vbox.add_child(btn)  # If using containers (recommended for UI)

func _on_dynamic_button_pressed(button_number):
	print("Button %d was pressed!" % button_number)
