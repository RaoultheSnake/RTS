extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$btn_Back.connect("pressed", self, "Back")
	$btn_Video.connect("pressed", self, "Video")
	$btn_Audio.connect("pressed", self, "Audio")
	$btn_Controls.connect("pressed", self, "Controls")
	
	pass



func Video():
	pass

func Audio():
	pass

func Controls():
	pass

func Back():
	get_tree().change_scene("res://Scenes/Main.tscn")
	pass
