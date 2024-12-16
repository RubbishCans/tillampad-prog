extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

var SPEED = 95.0

func _ready() -> void:
	_animated_sprite.play("idle_S")

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left2", "move_right2", "move_up2", "move_down2")

	velocity = direction * SPEED
	move_and_slide()
	
	if Input.is_action_pressed("move_up2") and Input.is_action_pressed("move_left2"):
		_animated_sprite.play("run_NW")
	elif Input.is_action_just_released("move_up2") and Input.is_action_just_released("move_left2"):
		_animated_sprite.play("idle_NW")
	elif Input.is_action_pressed("move_up2") and Input.is_action_pressed("move_right2"):
		_animated_sprite.play("run_NE")
	elif Input.is_action_just_released("move_up2") and Input.is_action_just_released("move_right2"):
		_animated_sprite.play("idle_NE")
	elif Input.is_action_pressed("move_down2") and Input.is_action_pressed("move_left2"):
		_animated_sprite.play("run_SW")
	elif Input.is_action_just_released("move_down") and Input.is_action_just_released("move_left2"):
		_animated_sprite.play("idle_SW")
	elif Input.is_action_pressed("move_down2") and Input.is_action_pressed("move_right2"):
		_animated_sprite.play("run_SE")
	elif Input.is_action_just_released("move_down2") and Input.is_action_just_released("move_right2"):
		_animated_sprite.play("idle_SE")
	elif Input.is_action_pressed("move_up2"):
		_animated_sprite.play("run_N")
	elif Input.is_action_just_released("move_up2"):
		_animated_sprite.play("idle_N")
	elif Input.is_action_pressed("move_left2"):
		_animated_sprite.play("run_W")
	elif Input.is_action_just_released("move_left2"):
		_animated_sprite.play("idle_W")
	elif Input.is_action_pressed("move_down2"):
		_animated_sprite.play("run_S")
	elif Input.is_action_just_released("move_down2"):
		_animated_sprite.play("idle_S")
	elif Input.is_action_pressed("move_right2"):
		_animated_sprite.play("run_E")
	elif Input.is_action_just_released("move_right2"):
		_animated_sprite.play("idle_E")
		

func _on_area_2d_area_entered(area):
	if area.is_in_group("speedpotion"):
		SPEED = 115
		await get_tree().create_timer(10.0).timeout
		SPEED = 95
	elif area.is_in_group("sizepotion"):
		scale = Vector2(1.2, 1.2)
		SPEED = 105
		await get_tree().create_timer(10.0).timeout
		scale = Vector2(1,1)
		SPEED = 95
	elif area.is_in_group("swedenpotion"):
		Global.play_anthem.emit()
