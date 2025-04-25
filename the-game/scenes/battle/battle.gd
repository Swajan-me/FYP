extends Node2D

# characterStats will be distributed from here to all the other parts of the code.
@export var char_stats: CharacterStats

@onready var battle_ui: BattleUI = $BattleUI

func _ready() -> void:
	# inorder to not reset the health, mana this is called.
	var new_stats: CharacterStats = char_stats.create_instance()
	battle_ui.char_stats = new_stats

func start_battle(stats: CharacterStats) -> void:
	print ("Battle has started.")
