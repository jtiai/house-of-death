extends Room

var EmptyTank = preload("res://items/empty_tank.tres")
var DivingGear = preload("res://items/diving_gear.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "go" and noun in ["south", "tank"] and EmptyTank in room_items:
		gm.lprint("The water has gone, and you fall rather heavily downwards.")
		gm.player.current_room = gm.room_manager.get_room("Room47")
		return [true, true]

	if verb == "go" and noun == "tank":
		if DivingGear in gm.player.inventory:
			gm.player.current_room = gm.room_manager.get_room("Room24")
		else:
			gm.lprint("You don't have gills! You are having a slight problem in this place!")
			gm.player.current_room = gm.room_manager.get_room("Room57")
		return [true, true]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

