extends Control

const CHAR_SELECTOR_SCENE := preload("res://scenes/ui/character_selector.tscn")


# 
func _ready() -> void:
	get_tree().paused = false

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(CHAR_SELECTOR_SCENE)
	#print("New game")


func _on_exit_pressed() -> void:
	get_tree().quit()
