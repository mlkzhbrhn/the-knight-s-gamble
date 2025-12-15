extends CharacterBody2D

const SPEED = 150.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO

	# Get movement input
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	var directionx = Input.get_axis("move_left", "move_right")
	var directiony = Input.get_axis("move_down", "move_up")
	#print(directionx, directiony)
	if directionx == 0 and directiony == 0:
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("run")
	if directionx > 0:
		animated_sprite_2d.flip_h = false
	elif directionx < 0:
		animated_sprite_2d.flip_h = true
	# Normalize so diagonal isn’t faster
	input_vector = input_vector.normalized()

	# Apply movement
	velocity = input_vector * SPEED
	move_and_slide()
