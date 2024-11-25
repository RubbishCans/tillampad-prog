extends Node2D

@onready var _animated_sprite = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("spin")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_replay_pressed():
	Global.e_d_count = 0
	get_tree().change_scene_to_file("res://main_scene.tscn")

func _on_quit_pressed():
	get_tree().quit()


