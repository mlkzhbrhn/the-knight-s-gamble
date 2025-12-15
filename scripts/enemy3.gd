extends Node2D

@export var speed := 95.0
@export var move_distance := 260        # how far to patrol from start
@export var vertical := false            
@export var start_direction := 1        # 1 = down/right, -1 = up/left

var start_position: Vector2
var direction: int

func _ready() -> void:
	start_position = global_position
	direction = start_direction

func _process(delta: float) -> void:
	if vertical:
		# Move vertically
		position.y += direction * speed * delta

		var top_limit = start_position.y - move_distance
		var bottom_limit = start_position.y + move_distance

		if position.y <= top_limit:
			position.y = top_limit
			direction = 1
		elif position.y >= bottom_limit:
			position.y = bottom_limit
			direction = -1
	else:
		# Move horizontally
		position.x += direction * speed * delta

		var left_limit = start_position.x
		var right_limit = start_position.x + move_distance

		if position.x <= left_limit:
			position.x = left_limit
			direction = 1
		elif position.x >= right_limit:
			position.x = right_limit
			direction = -1
