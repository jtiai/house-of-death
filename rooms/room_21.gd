extends Room

const Chandelier = preload("res://items/chandelier.tres")
const ShatteredChnadelier = preload("res://items/shattered_chandelier.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, _noun: String) -> Array:
	if verb == "take":
		if Chandelier in room_items:
			gm.lprint("It's too high, and you can't reach.")
			return [true, false]
		if ShatteredChnadelier in room_items:
			gm.lprint("There are too many bits!")
			return [true, false]
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

