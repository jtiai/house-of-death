extends Room

const CrystalOfOrc = preload("res://items/crystal_of_orc.tres")
const ClosedSafe = preload("res://items/closed_safe.tres")
const OpenSafe = preload("res://items/open_safe.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "home" or noun == "home":
		gm.lprint("... Darkness closes in .. and suddenly")
		gm.player.goto_room("Room01")
		return [true, true]
	if verb == "open" and noun == "safe":
		if ClosedSafe in room_items:
			gm.lprint("To do this you must enter a combination number")
		else:
			gm.lprint("The safe IS open!")
		return [true, false]
	if verb == "enter":
		if noun == ClosedSafe.stats.get("combination"):
			switch_item(ClosedSafe, OpenSafe)
			add_item(CrystalOfOrc)
		else:
			gm.lprint("WRONG!")
		return [true, false]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

