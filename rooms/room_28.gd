extends Room

const DangerousHole = preload("res://items/dangerous_hole.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "go" and noun in ["down", "stairs"]:
		if DangerousHole in room_items:
			gm.lprint("In your haste to descend, you seem to have tripped over a hole.")
			gm.player.current_room = gm.room_manager.get_room("Room57")
			return [true, true]
	if verb == "slide" or noun == "bannister":
		gm.lprint("Wheee!")
		gm.player.current_room = gm.room_manager.get_room("Room06")

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

