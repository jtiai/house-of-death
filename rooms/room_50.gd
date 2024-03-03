extends Room

const Vampire = preload("res://npcs/vampire.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "go" and noun == "east" and Vampire in room_items:
		if Vampire.stats.get("angry"):
			gm.lprint("Dracula gets fed up with this and...")
			gm.player.goto_room("Room57")
			return [true, true]
		else:
			Vampire.stats["angry"] = true
			gm.lprint("The nasty vampire won't let you!")
			return [true, false]
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

