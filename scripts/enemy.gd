extends Node2D

@export var speed := 80.0
@export var move_distance := 220.0   # how far up/down from start

var start_position: Vector2
var direction := 1

func _ready() -> void:
	start_position = global_position

func _process(delta: float) -> void:
	position.y += direction * speed * delta

	# Calculate top & bottom bounds
	var top_limit = start_position.y
	var bottom_limit = start_position.y + move_distance

	# Check bounds and flip direction
	if position.y <= top_limit:
		position.y = top_limit   # snap back inside
		direction = 1
	elif position.y >= bottom_limit:
		position.y = bottom_limit
		direction = -1
