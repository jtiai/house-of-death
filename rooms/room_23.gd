extends Room

var UnknownItem = Item.new()

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "go" and noun in ["south", "tank"] and UnknownItem in room_items:
		gm.lprint("The water has gone, and you fall rather heavily downwards.")
		gm.player.current_room = gm.room_manager.get_room("Room47")
		return [true, true]
	
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

