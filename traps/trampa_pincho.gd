extends Area2D

@onready var sprite := $AnimatedSprite2D
@onready var collision := $CollisionShape2D

var player = load("res://player/main_character.tscn")

func _process(delta):
	collision.disabled = sprite.frame == 0 or sprite.frame == 6

	

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "MainCharacter":
		body.death()
