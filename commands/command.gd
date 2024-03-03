extends Node
class_name Command

var gm: GameManager

## Handle command with given noun
func _handle_verb(_noun: String) -> Array:
	return [false, false]
