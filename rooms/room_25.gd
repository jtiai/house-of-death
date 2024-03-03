extends Room

const Weights = preload("res://items/weights.tres")
const DangerousHole = preload("res://items/dangerous_hole.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(_verb: String, _noun: String) -> Array:
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	# Check player weight
	if gm.player.get_weight() > 78 or Weights in gm.player.inventory:
		gm.lprint("AAAAAAaaaaaaahh. crunch!")
		gm.player.current_room = gm.room_manager.get_room("Room45")
		add_item(DangerousHole, 0)
		return true

	return false
