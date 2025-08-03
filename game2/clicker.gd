extends Control

var score: int = 0
var click_power: int = 1
var upgrade_cost: int = 10

@onready var score_label: Label = %ScoreLabel
@onready var click_button: Button = %ClickButton
@onready var upgrade_button: Button = %UpgradeButton

func _ready():
	update_display()

func _on_click_button_pressed():
	score += click_power
	update_display()

func _on_upgrade_button_pressed():
	if score >= upgrade_cost:
		score -= upgrade_cost
		click_power += 1
		upgrade_cost = int(upgrade_cost * 1.5)
		update_display()

func update_display():
	score_label.text = "Score: " + str(score)
	upgrade_button.text = "Upgrade (" + str(upgrade_cost) + ")"
	upgrade_button.disabled = score < upgrade_cost
