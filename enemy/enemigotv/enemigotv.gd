class_name enemigotv extends CharacterBody2D


enum State{
	IDLE,
	AWARE,
	DEAD,
}

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 1000.0

var _state := State.IDLE

@onready var animation_sprite := $AnimatedSprite2D as AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		_state = State.IDLE
		velocity.y += GRAVITY * delta
	else:
		if _state == State.IDLE:
			velocity.x = 0
		elif _state == State.AWARE:
			velocity.x = -SPEED	
		else:
			velocity.x = 0
	
	var animation := get_new_animation()
	if animation != animation_sprite.animation:
		animation_sprite.play(animation)
		
	move_and_slide()
		
		
func get_new_animation() -> StringName:
	var animation_new: StringName
	if _state == State.IDLE:
		animation_new = &"idle"
	elif _state == State.AWARE:
		animation_new = &"run"
	else:
		animation_new = &"die" 
	return animation_new


func _on_vision_body_entered(body: Node2D) -> void:
	if body.get_name() == "MainCharacter":
		_state = State.AWARE


func _on_colision_body_entered(body: Node2D) -> void:
	if body.get_name() == "MainCharacter":
		body.death()
