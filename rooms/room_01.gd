extends Room

const ClosedDoor = preload("res://items/closed_door.tres")
const OpenDoor = preload("res://items/open_door.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	# Let's hook up go north
	if verb == "go" and noun == "north":
		if ClosedDoor in room_items:
			gm.lprint("The door is firmly shut")
			return [true, false]

	if verb == "open" and noun =="door":
		if ClosedDoor in room_items:
			gm.lprint("The door doesn't budge.")
		else:
			gm.lprint("The door is already open.")
		return [true, false]

	if verb == "use" and noun == "knocker":
		gm.lprint("There is a sound... Knock Knock.")
		switch_item(ClosedDoor, OpenDoor)
		return [true, false]

	if verb == "ring" and noun == "bell":
		gm.lprint("There is a sound.. Ding Dong.")
		switch_item(ClosedDoor, OpenDoor)
		return [true, false]

	if gm.clock["hour"] > 18:
		if OpenDoor in room_items:
			gm.lprint("Have you looked at the door?")
		elif gm.clock["minutes"] > 1:
			gm.lprint("Have you announced your arrival?")
		return [true, false]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

