extends Room

const Werewolf = preload("res://npcs/werewolf.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "go" and noun in ["east", "chute"] and Werewolf in room_npcs:
		if Werewolf.stats.get("angry"):
			gm.lprint("The werewolf springs......")
			gm.player.goto_room("Room57")
			return [true, true]
		else:
			Werewolf.stats["angry"] = true
			gm.lprint("The werewolf snarls, stopping your passage!")
			return [true, false]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

