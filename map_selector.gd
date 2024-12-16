extends Control

@onready var NoMap = $NoMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_plains_button_pressed():
	get_tree().change_scene_to_file("res://maps/plains_map.tscn")


func _on_cave_button_pressed():
	NoMap.visible = true
	await get_tree().create_timer(1).timeout
	NoMap.visible = false


func _on_tundra_button_pressed():
	NoMap.visible = true
	await get_tree().create_timer(1).timeout
	NoMap.visible = false
