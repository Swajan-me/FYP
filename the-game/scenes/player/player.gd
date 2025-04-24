class_name Player
extends Node2D

@export var stats: CharacterStats : set = set_character_stats

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var stats_ui: StatsUI = $StatsUI

# Test code for health and sheild for the player
#func _ready() -> void:
	#await get_tree().create_timer(4).timeout
	#take_damage(20)
	#stats.block += 10


func set_character_stats(value: CharacterStats) -> void:
	stats = value.create_instance()
	
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)
	
	update_player()

func update_player() -> void:
	if not stats is CharacterStats: 
		return
	if not is_inside_tree(): 
		await ready
		
	sprite_2d.texture = stats.art
	update_stats()

# Handles the updaing the stats of the player
func update_stats() -> void:
	stats_ui.update_stats(stats)

func take_damage(damage: int) -> void:
	if stats.health <= 0:         #Checking if we are dead or not.
		return
	
	stats.take_damage(damage)	#damage to the player.
	
	if stats.health <= 0:		
		queue_free()
