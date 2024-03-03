extends Room

const Portrait = preload("res://items/portrait.tres")
const RemovedSafe = preload("res://items/removed_safe.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "take" and noun == "portrait" and Portrait in room_items:
		gm.lprint("Pickup move portrait carefully...")
		gm.player.pick_item(Portrait)
		add_item(RemovedSafe)
		return [true, false]
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

