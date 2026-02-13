extends Control

@onready var start_button = $TextureRect/CenterContainer/VBoxContainer/Iniciar 
@onready var sfx_button = $TextureRect/CenterContainer/VBoxContainer/SFXButton 
@onready var music_button = $TextureRect/CenterContainer/VBoxContainer/MusicButton
@onready var click_button = $AudioStreamPlayer

func _ready():
	pass

	
func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://juego.tscn")

func _on_sfx_button_pressed() -> void:
	click_button.play()
	await click_button.finished
	MusicManager.toggle_sfx()
	if MusicManager.is_sfx_active:
		sfx_button.text = "SFX: ON"
	else:
		sfx_button.text = "SFX: OFF"


func _on_music_button_pressed() -> void:
	click_button.play()
	await click_button.finished
	MusicManager.toggle_music()
	if MusicManager.is_music_active:
		music_button.text = "MUSIC: ON"
	else:
		music_button.text = "MUSIC: OFF"

	
func _on_salir_pressed() -> void:
	click_button.play()
	await click_button.finished
	get_tree().quit()
	
func _play_button_sound():
	click_button.play()
	await click_button.finished
