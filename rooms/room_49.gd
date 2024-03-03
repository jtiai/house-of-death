extends Room

const Mummy = preload("res://npcs/mummy.tres")

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "go" and noun == "south" and Mummy in room_npcs:
		if Mummy.stats.get("angry"):
			gm.lprint("The mummy comes towards your saying KARIC WANT TANA")
		else:
			gm.lprint("The mummy stops your progress")
			Mummy.stats["angry"] = true
			return [true, false]
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false

