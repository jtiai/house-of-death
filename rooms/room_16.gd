extends Room

const Frog = preload("res://items/frog.tres")
const Potion = preload("res://items/potion.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "attack" and noun == "witch":
		gm.lprint("The witch creates an aura around herself for protection.")
		return [true, false]
	if verb == "drop" and noun == "frog" and Frog in gm.player.inventory:
		gm.player.use_item(Frog)
		gm.player.pick_item(Frog)
		gm.lprint("The witch takes the frog, stirs it into her foul soup and gives you a phial of blue liquid")
		return [true, false]
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

