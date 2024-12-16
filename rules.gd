extends Control

@onready var _animated_player = $Playerspin
@onready var _animated_gentleman = $Gentlemanspin
@onready var _animated_enemy = $Enemyspin

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_player.play("spin")
	_animated_player.scale = Vector2(3, 3)
	
	_animated_gentleman.play("spin")
	_animated_gentleman.scale = Vector2(3, 3)
	
	_animated_enemy.play("spin")
	_animated_enemy.scale = Vector2(3, 3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://start_scene.tscn")
