extends Room

## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func _handle_command(_verb: String, _noun: String) -> Array:
	return [false, false]

## Handle player entering to room (automatic actions)
## Returns false if nothing happened, true otherwise
func _on_enter() -> bool:
	return false
