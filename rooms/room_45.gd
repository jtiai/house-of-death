extends Room

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "push":
		if noun == "north":
			gm.lprint("The wall spins round.. dizzily you emerge.")
			gm.player.goto_room("Room6")
			return [true, true]
		if noun == "east":
			gm.lprint("The wall spins round.. dizzily you emerge.")
			gm.player.goto_room("Room46")
			return [true, true]
		if noun in ["south", "west"]:
			gm.lprint("The wall doesn't budge.")
			return [true, false]
		if noun == "wall":
			gm.lprint("Please say which wall, e.g. push west")
			return [true, false]
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

