extends Room

const SmallEffect = preload("res://effects/small.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "go" and noun == "south":
		if SmallEffect in gm.player.effects:
			gm.player.current_room = gm.room_manager.get_room("Room41")
			return [true, true]

		gm.lprint("Oh dear, the ledge is just a bit too narrow to stand on")
		gm.player.current_room = gm.room_manager.get_room("Room57")
		return [true, true]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

