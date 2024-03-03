extends Command

## Handle command with given noun
func _handle_verb(_noun: String) -> Array:
	gm.lprint("You see:")
	for item in gm.player.current_room.room_items:
		gm.lprint(item.item_name)
	for npc in gm.player.current_room.room_npcs:
		gm.lprint(npc.npc_name)
	return [false, false]
