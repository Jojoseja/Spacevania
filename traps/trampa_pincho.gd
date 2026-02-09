extends Area2D

var player = load("res://player/main_character.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "MainCharacter":
		body.death()
