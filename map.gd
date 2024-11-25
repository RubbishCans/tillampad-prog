extends TileMap

signal display_sign_text
signal hide_sign_text

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_area_entered(area):
	display_sign_text.emit()

func _on_area_2d_area_exited(area):
	hide_sign_text.emit()

