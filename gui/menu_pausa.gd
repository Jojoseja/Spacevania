class_name MenuPausa extends Control

@onready var click_button = $AudioStreamPlayer

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
	click_button.play()
	await click_button.finished
	close()

# Signal de Salir
func _on_salir_pressed() -> void:
	click_button.play()
	await click_button.finished
	if visible:
		get_tree().quit()
