extends AudioStreamPlayer

var is_sfx_active = true
var is_music_active = true

@onready var songs: Array[AudioStream] = [
	preload("res://assets/Sounds/Music/Untitled-3.mp3"),
	preload("res://assets/Sounds/Music/Untitled-2.mp3"),
	preload("res://assets/Sounds/Music/Untitled.mp3")
]

func _ready():
	volume_db = -24
	finished.connect(_on_finished)
	if is_music_active:
		_play_random()

func toggle_sfx():
	is_sfx_active = not is_sfx_active

func toggle_music():
	is_music_active = not is_music_active
	if not is_music_active:
		volume_db = -100

func _play_random() -> void:
	stream = songs.pick_random()
	play()
	
func _on_finished() -> void:
	_play_random()
