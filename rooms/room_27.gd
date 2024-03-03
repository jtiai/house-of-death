extends Room

const ClosedBox = preload("res://items/closed_box.tres")
const OpenBox = preload("res://items/open_box.tres")
const Garlic = preload("res://items/garlic.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "open" and noun == "box" and ClosedBox in room_items:
		gm.lprint("There's Garlic here!")
		switch_item(ClosedBox, OpenBox)
		add_item(Garlic)
		return [true, false]
	else:
		gm.lprint("Box is open already!")
		return [true, false]

	if verb == "take" and noun == "box":
		gm.lprint("The box is too heavy.")
		return [true, false]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

