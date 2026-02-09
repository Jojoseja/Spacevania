extends CanvasLayer

func _process(_delta):
	$Label.text = str(GameManager.cont_death)
