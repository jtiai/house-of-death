extends Room

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(verb: String, noun: String) -> Array:
	if verb == "go" and noun == "tree":
		gm.lprint("Trees cannot be climbed.")
		return [true, false]
	return [false, false]
