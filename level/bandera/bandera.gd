extends Area2D

@onready var sprite := $AnimatedSprite2D
@onready var collision := $CollisionShape2D
@onready var victoria = get_parent().get_node("CanvasLayer/VictoriaPantalla")

var player = load("res://player/main_character.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "MainCharacter":
		victoria.open()
