extends Command

const SYNONYMS = [
	"walk",
	"run",
	"travel",
	"enter",
	"climb",
	"swim",
	"dive",
	"crawl",
]

const DIRECTION_NOUNS = [
	"north",
	"south",
	"east",
	"west",
	"up",
	"down",
	"in",
	"out",
]

## Handle command with given noun
func _handle_verb(noun: String) -> Array:
	if noun in DIRECTION_NOUNS:
		if not gm.player.goto_direction(noun):
			gm.pprint("Can't go that direction!")

	return [true, true]
