extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

@export var walk_speed = 150.0
@export var run_speed = 250.0
@export var jump_force = -400.0
@export_range(0,1) var deceleration = 0.1
@export_range(0,1) var acceleration = 0.1
@export_range(0,1) var decelerate_on_jump_release = 0.5
var is_dead = false;

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		velocity.y = jump_force 

	if Input.is_action_just_released("jump") and velocity.y < 0: 
		velocity.y *= decelerate_on_jump_release
		

	var speed 
	if Input.is_action_pressed("sprint"):
		speed = run_speed
	else: 
		speed = walk_speed

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if not is_on_floor():
		if velocity.y > 0:
			anim.play("fall")
			
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, speed * acceleration)
		if Input.is_action_pressed("sprint"):
			anim.play("run")
		else:
			anim.play("walk")
		anim.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * deceleration)
		anim.play("idle")
	move_and_slide()
	
func death():
	is_dead = true
	set_physics_process(false) 
	anim.play("dead")
	await (anim.animation_finished)
	get_tree().paused = false
	get_tree().reload_current_scene()
