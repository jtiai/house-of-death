extends Node
class_name Player

var gm: GameManager = null
var current_room = null

var inventory: Array[Item] = []

func initialize(p_game_manager: GameManager):
	gm = p_game_manager


func goto_direction(noun: String) -> bool:
	var new_room = current_room.goto(noun)
	if new_room == null:
		return false
	current_room = new_room
	return true


func get_weight(new_item: Item = null) -> int:
	var total_weight = 0
	for item in inventory:
		total_weight += item.item_weight

	if new_item:
		total_weight += new_item.item_weight

	return total_weight


func use_item(item: Item) -> void:
	inventory.erase(item)


func pick_item(item: Item) -> void:
	# TODO: add weight check
	inventory.append(item)
