extends Node

const IGNORED_WORDS = [
	"from", "to", "thro", "unde", "over", "aro", "at", "on"," the", "an", "a"
]

var gm: GameManager = null

var verb_to_callable = {}

func _ready():
	# Detect possible verbs and their callables
	for child in get_children():
		var verb = child.name.to_lower()
		var callable = Callable(child, "_handle_verb")
		verb_to_callable[verb] = [verb, callable]

		var synonyms = child.get("SYNONYMS")
		if synonyms != null:
			for synonym in synonyms:
				verb_to_callable[synonym] = [verb, callable]


func initialize(game_manager: GameManager):
	gm = game_manager

	for cmd in get_children():
		cmd.gm = game_manager


## Command handler for verb and noun
## Returns false if command not handled, true otherwise
func handle_command(command: String) -> Array:
	var verb: String = ""
	var noun: String = ""
	var raw_parts: PackedStringArray
	var parts: PackedStringArray = PackedStringArray()

	raw_parts = command.to_lower().split(" ", false)

	# Drop out ignored words
	for part in raw_parts:
		if part.left(4) in IGNORED_WORDS:
			continue
		parts.append(part)

	verb = parts[0]

	if parts.size() > 1:
		noun = parts[1]

	var verb_map = verb_to_callable.get(verb)
	var verb_callable = null

	var normalized_verb = verb
	if verb_map != null:
		normalized_verb = verb_map[0]
		verb_callable = verb_map[1]

	var result = gm.player.current_room._handle_command(normalized_verb, noun)
	if result[0]:
		return result # Command was handled in current room

	# Didn't understand
	if verb_callable == null:
		gm.pprint("Unknown command '%s'. Please Retry." % verb)
		return [false, false]

	return verb_callable.call(noun)

