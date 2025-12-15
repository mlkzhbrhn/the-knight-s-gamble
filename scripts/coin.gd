extends Area2D


@onready var manager = %manager

func _on_body_entered(body: Node2D) -> void:
	print("Check!") # Replace with function body.
	manager.add_stage()
	queue_free()
