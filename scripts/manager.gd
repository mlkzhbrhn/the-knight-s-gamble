extends Node
@onready var label: Label = $Label


var current_stage = 1

func add_stage():
	current_stage += 1
	if current_stage == 2:
		print(current_stage)
	
