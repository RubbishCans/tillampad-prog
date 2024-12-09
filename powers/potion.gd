extends Area2D

@onready var _animated_potion = $AnimatedSprite2D
@onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_potion.play("fill")
	await get_tree().create_timer(1.0).timeout
	label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_entered(_area):
	queue_free()
