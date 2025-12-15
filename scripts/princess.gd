extends CharacterBody2D

func _ready():
	$WinZone.body_entered.connect(_on_WinZone_body_entered)

func _on_WinZone_body_entered(body):
	if body.is_in_group("player"):  # make sure it's the hero
		print("YOU WIN!")
		get_tree().change_scene_to_file("res://scenes/WinScreen.tscn")
