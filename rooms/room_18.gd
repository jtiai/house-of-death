extends Room

const Tadpole = preload("res://items/tadpole.tres")
const Frog = preload("res://items/frog.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "push" and noun == "button":
		if Tadpole in gm.player.inventory or Tadpole in room_items:
			gm.lprint("There is a zap as the machinery alters the molecular structure of the creature you were holding")
			gm.player.use_item(Tadpole)
			remove_item(Tadpole)
			add_item(Frog)
			return [true, false]
		if Frog in gm.player.inventory or Frog in room_items:
			gm.lprint("The frog turns into a handsome prince. Seeing you, he says 'eeuurgh!' and departs hurriedly")
			gm.player.use_item(Frog)
			remove_item(Frog)
			return [true, false]
		gm.lprint("There is a click, as absolutely nothing happens")
		return [true, false]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false
