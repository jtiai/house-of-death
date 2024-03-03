extends Room

const Carpet = preload("res://items/carpet.tres")
const PulledCarpet = preload("res://items/pulled_carpet.tres")
const Bolts = preload("res://items/bolts.tres")
const LooseBolts = preload("res://items/loose_bolts.tres")
const Chandelier = preload("res://items/chandelier.tres")
const ShatteredChandelier = preload("res://items/shattered_chandelier.tres")
const ExpensiveChandelier = preload("res://items/expensive_chandelier.tres")
const Mattress = preload("res://items/mattress.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "pull":
		verb = "take"

	if verb == "take" and noun == "carpet":
		if Carpet in room_items:
			gm.lprint("The carpet is too heavy to lift, but you have pulled it to one side.")
			switch_item(Carpet, PulledCarpet)
			add_item(Bolts)
			return [true, false]
		if PulledCarpet in room_items:
			gm.lprint("As I said, the carpet is too heavy")
			return [true, false]
	if verb == "loose" and noun.begins_with("bolt"):
		if Bolts in room_items:
			gm.lprint("The bolts twist off and there is a dull thud from below")
			switch_item(Bolts, LooseBolts)
			var room21 = gm.room_manager.get_room("Room21")
			if Mattress in room21.room_items:
				room21.switch_item(Chandelier, ExpensiveChandelier)
			else:
				room21.switch_item(Chandelier, ShatteredChandelier)
		else:
			gm.lprint("Bolts spin around the floor.")
		return [true, false]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

