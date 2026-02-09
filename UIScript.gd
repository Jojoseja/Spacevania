extends CanvasLayer

func _process(_delta):
	$Label.text = str("Muertes:  ", GameManager.cont_death)
