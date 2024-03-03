extends Room

const DivingGear = preload("res://items/diving_gear.tres")
const RustyKey = preload("res://items/rusty_key.tres")
const HugeDoor = preload("res://items/huge_door.tres")
const Water = preload("res://items/a_lot_of_water.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "open" and noun == "door":
		if gm.player.has_item(DivingGear) and gm.player.has_item(RustyKey) and HugeDoor in room_items:
			remove_item(HugeDoor)  # TODO: Open/closed door
			add_item(Water)
			return [true, false]
		if not gm.player.has_item(RustyKey):
			gm.lprint("You need a key!")
			return [true, false]
		if HugeDoor in room_items and not gm.player.has_item(DivingGear):
			gm.lprint("Unfortunately you cannot breath under water")
			gm.player.goto_room("Room57")
			return [true, true]
	elif verb == "go" and noun in ["east", "door"] and Water not in room_items:
		gm.lprint("The door's locked")
		return [true, false]
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false
