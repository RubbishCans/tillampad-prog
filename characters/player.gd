extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var particles = $GPUParticles2D

var SPEED = 100.0

func _ready() -> void:
	particles.emitting = false
	_animated_sprite.play("idle_S")
	

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction * SPEED
	move_and_slide()
	
	if Input.is_action_pressed("move_up") and Input.is_action_pressed("move_left"):
		_animated_sprite.play("run_NW")
	elif Input.is_action_just_released("move_up") and Input.is_action_just_released("move_left"):
		_animated_sprite.play("idle_NW")
	elif Input.is_action_pressed("move_up") and Input.is_action_pressed("move_right"):
		_animated_sprite.play("run_NE")
	elif Input.is_action_just_released("move_up") and Input.is_action_just_released("move_right"):
		_animated_sprite.play("idle_NE")
	elif Input.is_action_pressed("move_down") and Input.is_action_pressed("move_left"):
		_animated_sprite.play("run_SW")
	elif Input.is_action_just_released("move_down") and Input.is_action_just_released("move_left"):
		_animated_sprite.play("idle_SW")
	elif Input.is_action_pressed("move_down") and Input.is_action_pressed("move_right"):
		_animated_sprite.play("run_SE")
	elif Input.is_action_just_released("move_down") and Input.is_action_just_released("move_right"):
		_animated_sprite.play("idle_SE")
	elif Input.is_action_pressed("move_up"):
		_animated_sprite.play("run_N")
	elif Input.is_action_just_released("move_up"):
		_animated_sprite.play("idle_N")
	elif Input.is_action_pressed("move_left"):
		_animated_sprite.play("run_W")
	elif Input.is_action_just_released("move_left"):
		_animated_sprite.play("idle_W")
	elif Input.is_action_pressed("move_down"):
		_animated_sprite.play("run_S")
	elif Input.is_action_just_released("move_down"):
		_animated_sprite.play("idle_S")
	elif Input.is_action_pressed("move_right"):
		_animated_sprite.play("run_E")
	elif Input.is_action_just_released("move_right"):
		_animated_sprite.play("idle_E")
		
	
func _on_area_2d_area_entered(area):
	if area.is_in_group('gentleman'):
		particles.emitting = true
		await get_tree().create_timer(0.15).timeout
		get_tree().change_scene_to_file("res://final_score.tscn")
		queue_free()
		
	if area.is_in_group("speedpotion"):
		SPEED = 200
		await get_tree().create_timer(10.0).timeout
		SPEED = 100
	elif area.is_in_group("sizepotion"):
		scale = Vector2(1.5, 1.5)
		SPEED = 110
		await get_tree().create_timer(10.0).timeout
		scale = Vector2(1,1)
		SPEED = 100
	elif area.is_in_group("swedenpotion"):
		Global.play_anthem.emit()
