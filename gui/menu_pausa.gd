class_name MenuPausa extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func close() -> void:
	get_tree().paused = false
	visible = false

func open() -> void:
	visible = true
	get_tree().paused = true

# Sinal de Continuar
func _on_continuar_pressed() -> void:
	close()

# Signal de Salir
func _on_salir_pressed() -> void:
	if visible:
		get_tree().quit()
