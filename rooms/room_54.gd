extends Room

const CrystalOfOrc = preload("res://items/crystal_of_orc.tres")
const Potion = preload("res://items/potion.tres")
const ClosedSafe = preload("res://items/closed_safe.tres")
const OpenSafe = preload("res://items/open_safe.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb in ["drop", "break", "empty"] and noun == "potion":
		if gm.player.has_item(Potion):
			gm.lprint("Hey, this stuff has burnt away the floor!")
			gm.lprint("You're falling through it!")
			gm.player.goto_room("Room55")
			return [true, true]
	if verb == "push" and noun == "button":
			gm.player.goto_room("Room06")
			return [true, true]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

