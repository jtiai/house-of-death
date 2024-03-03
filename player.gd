extends Node
class_name Player

const Bun = preload("res://items/bun.tres")
const Cake = preload("res://items/cake.tres")
const SmallEffect = preload("res://effects/small.tres")
const ClearSeeingEffect = preload("res://effects/clear_seeing.tres")

var gm: GameManager = null
var current_room = null

var inventory: Array[Item] = []
var effects: Array[Effect] = []

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
	if item in [Bun, Cake]:
		if SmallEffect in effects:
			add_effect(ClearSeeingEffect)
		else:
			add_effect(SmallEffect)

	inventory.erase(item)


func pick_item(item: Item) -> void:
	# TODO: add weight check
	if item in current_room.room_items:
		current_room.remove_item(item)
		inventory.append(item)
	else:
		gm.lprint("You can't pick that!")


func add_effect(effect: Effect) -> void:
	effects.append(effect)


func remove_effect(effect: Effect) -> void:
	effects.erase(effect)


func goto_room(room_name: String) -> void:
	current_room = gm.room_manager.get_room(room_name)


func is_in_room(room_name: String) -> bool:
	return current_room == gm.room_manager.get_room(room_name)


func is_in_any_room(room_names: Array[String]) -> bool:
	for room_name in room_names:
		if current_room == gm.room_manager.get_room(room_name):
			return true
	return false


func has_item(item: Item) -> bool:
	return item in inventory
