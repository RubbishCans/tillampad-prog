extends Area2D

@onready var _animated_potion = $AnimatedSprite2D

signal potion_pickup

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_potion.play("fill")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_entered(area):
	if area.is_in_group("player"):
		potion_pickup.emit()
		print("hi")
