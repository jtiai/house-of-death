extends Command

## Handle command with given noun
func _handle_verb(noun: String) -> Array:
	# Look at items in inventory
	for item in gm.player.inventory:
		if item.item_name.to_lower() == noun:
			gm.lprint(item.item_description)
			return [true, false]

	# Look at items in current room
	for item in gm.player.current_room.room_items:
		if item.item_name.to_lower() == noun:
			gm.lprint(item.item_description)
			return [true, false]

	# Look at NPCs
	for npc in gm.player.current_room.room_npc:
		if npc.npc_name.to_lower() == noun:
			gm.lprint(npc.)
			return [true, false]

	if noun == "stairs" and gm.player.is_in_any_rooms(["Room06", "Room25", "Room35", "Room28", "Room37"]):
		gm.lprint("The stairs facilitate vertical transportation.")
		return [true, false]

	gm.lprint("You see:")
	for item in gm.player.current_room.room_items:
		gm.lprint(item.item_name)
	for npc in gm.player.current_room.room_npcs:
		gm.lprint(npc.npc_name)
	return [false, false]
