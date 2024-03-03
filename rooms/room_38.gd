extends Room

const ClearSeeingEffect = preload("res://effects/clear_seeing.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if noun == "mirror":
		if verb == "go":
			if ClearSeeingEffect in gm.player.effects:
				gm.player.current_room = gm.room_manager.get_room("Room39")
				return [true, true]
			else:
				gm.lprint("BANG..! (OUCH)")
				return [true, false]
		if verb == "break":
			gm.lprint("The mirror is unbreakable; lucky in view of the next seven years")
			return [true, false]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

