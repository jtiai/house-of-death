extends Room

const MileoMeter = preload("res://items/mileometer.tres")
const ClosedSafe = preload("res://items/closed_safe.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if noun == "bike" and verb in ["ride", "use"]:
		gm.lprint("The bike is fixed so that it doesn't actually move")
		return [true, false]

	if verb == "look" and noun == "mileage":
		if not ClosedSafe.stats.get("code"):
			ClosedSafe.stats["code"] = randi_range(1, 100000)
		gm.lprint("The mileometer reads: %05d" % ClosedSafe.stats["code"])
		return [true, false]

	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

