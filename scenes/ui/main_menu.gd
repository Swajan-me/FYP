extends Control

const CHAR_SELECTOR_SCENE := preload("res://scenes/ui/character_selector.tscn")


# 
func _ready() -> void:
	get_tree().paused = false

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(CHAR_SELECTOR_SCENE)
	#print("New game")

func _on_settings_pressed() -> void:
	var current_db = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	if current_db <= -30:  # muted
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), 0)  # unmute
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -30)  # mute
		
	print("Music volume toggled. Current dB:", AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))

func _on_exit_pressed() -> void:
	get_tree().quit()
