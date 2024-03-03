extends Resource
class_name NPC

@export var npc_name: String = "NPC"
@export var current_room: Room = null


func set_room(new_room: Room):
	if current_room:
		current_room.remove_npc(self)
	current_room = new_room
	if new_room:
		new_room.add_npc(self)
