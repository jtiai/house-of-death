extends Command

const SYNONYMS = [
	"get",
	"pick",
]

## Handle command with given noun
func _handle_verb(_noun: String) -> Array:
	return [false, false]

