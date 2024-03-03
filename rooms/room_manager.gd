extends Node
class_name RoomManager

var gm: GameManager = null


func initialize(game_manager: GameManager):
	gm = game_manager

	for room in get_children():
		room.gm = game_manager


func get_random_room() -> Room:
	return get_children().pick_random()


func get_room(room_name: String) -> Room:
	return get_node(room_name)
