extends TileMap

@onready var anthem = $SwedenAnthem

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	Global.play_anthem.connect(play_anthem)
	
func play_anthem():
	anthem.play()

func _on_area_2d_area_entered(_area):
	Global.display_sign_text.emit()

func _on_area_2d_area_exited(_area):
	Global.hide_sign_text.emit()

