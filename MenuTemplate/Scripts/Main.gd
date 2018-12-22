extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$btn_Singleplayer.connect("pressed", self, "Singleplayer")
	$btn_Options.connect("pressed", self, "Options")
	$btn_Quit.connect("pressed", self, "Quit")
	
	pass

func Singleplayer():
	get_tree().change_scene("res://Scenes/SinglePlayer.tscn")
	pass
	
func Options():
	get_tree().change_scene("res://Scenes/Options.tscn")
	pass

func Quit():
	get_tree().quit()
	pass
	