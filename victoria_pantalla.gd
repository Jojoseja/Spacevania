class_name VictoriaPantalla extends Control

@onready var click_button = $AudioStreamPlayer
@onready var aplausos = $Aplausos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	aplausos.stop()


func close() -> void:
	aplausos.stop()
	get_tree().paused = false
	visible = false

func open() -> void:
	visible = true
	get_tree().paused = true
	aplausos.play()


# Volver a jugar
func _on_volver_a_jugar_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	GameManager.cont_death = 0


# Signal de Salir
func _on_salir_pressed() -> void:
	if visible:
		get_tree().quit()
