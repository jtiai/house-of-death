extends Node
class_name Room

## Title of the room. Not shown.
@export var room_title: String = "Default room"

## Room description shown in the game.
@export_multiline var room_description: String = "You're in default room."

@export var room_items: Array[Item] = []

## A list of exits from the room.
@export var room_exits: Array[RoomExit] = []

## A list of NPCs in the room
@export var room_npcs: Array[NPC] = []

## Game manager set by room manager.
var gm: GameManager = null


func _ready() -> void:
	# Adjust NPCs
	for npc in room_npcs:
		npc.set_room(self)

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(_verb: String, _noun: String) -> Array:
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false


func goto(direction: String) -> Room:
	for exit in room_exits:
		if exit.direction.to_lower() == direction.to_lower():
			return get_node(exit.target_room) as Room
	return null


func add_npc(npc: NPC, pos: int = -1):
	room_npcs.append(npc)
	if pos < 0:
		pos = room_npcs.size() + pos + 1
	room_npcs.insert(pos, npc)


func remove_npc(npc: NPC):
	room_npcs.erase(npc)


func add_item(item: Item, pos: int = -1):
	if pos < 0:
		pos = room_items.size() + pos + 1
	room_items.insert(pos, item)


func remove_item(item: Item):
	room_items.erase(item)


func switch_item(from: Item, to: Item):
	var item_pos = room_items.find(from)
	if item_pos >= 0:
		room_items[item_pos] = to
	else:
		Console.print_line("Item '%s' doesn't exist in room '%s'" % [from.item_name, room_title])
