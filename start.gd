extends Control

@onready var star = $Star
# Called when the node enters the scene tree for the first time.
func _ready():
	star.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
