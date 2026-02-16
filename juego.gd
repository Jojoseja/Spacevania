class_name Juego extends Node

@onready var _menu_pausa := $CanvasLayer/MenuPausa as MenuPausa
@onready var _victoria_pantalla := $CanvasLayer/VictoriaPantalla as VictoriaPantalla

var player = load("res://player/main_character.tscn")

func _ready() -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"Pause"):
		var tree := get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			_menu_pausa.open()
		else:
			_menu_pausa.close()
		get_tree().root.set_input_as_handled()
