extends Control

@onready var star = $Star

# Called when the node enters the scene tree for the first time.
func _ready():
	star.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://map_selector.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_rules_pressed():
	get_tree().change_scene_to_file("res://rules.tscn")
