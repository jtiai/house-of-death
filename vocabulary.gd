extends Object
class_name Vocabulary

## Direction nouns for movement
enum DirectionNoun {
	NULL = 0,  ## "Nothing"
	NORTH = 1,  ## North
	SOUTH = 2,  ## South
	EAST = 3,  ## East
	WEST = 4,  ## West
	UP = 5,  ## Up
	DOWN = 6,  ## Down
}

enum Noun {
	NULL = 0,
	NORTH = 1,
	SOUTH = 2,
	EAST = 3,
	WEST = 4,
	UP = 5,
	DOWN = 6,
	LEAVES = 7,
	DIVING_GEAR = 8,
	WEREWOLF_MASK = 9,
	DANGEROUS_HOLE = 10,
	TANK = 11,
	CHANDELIER = 12,
	MATTRESS = 13,
	SLEEP = 14,
	TADPOLE =15,
	PHIAL = 16,
	FROG = 17,
	GARLIC = 18,
	WEIGHT = 19,
	TRAPDOOR = 20,
	BOLT = 21,
	CARPET = 22,
	MIRROR = 23,
	KEY = 24,
	PORTRAIT = 25,
	SAFE = 26,
	DOOR = 27,
	MUMMY = 28,
	GOLDEN_SCEPTRE = 29,
	DRACULA = 30,
	WEREWOLF = 31,
	FLOOR = 32,
	CAKE = 33,
	BUN = 34,
	NOTE = 35,
	HOME = 36,
	RAIN = 37,
	CRYSTAL_ORC = 38,
	KNOCKER = 39,
	BELL = 40,
	BRACELET = 41,
	WALL = 43,
	BANN = 44,
	STAIRS = 45,
	BUTTON = 46,
	BIKE = 47,
	MILEAGE = 48,
	WINDOW = 49,
	ROOM = 50,
	WITCH = 51,
	CAULDRON = 52,
	GATE = 53,
	OUT = 54,
	SHED = 55,
	CHUTE = 56,
	IEXPLODE = 57,
	INVENTORY = 58,
}

const DIRECTIONS = [
	Noun.NORTH,
	Noun.SOUTH,
	Noun.EAST,
	Noun.WEST,
	Noun.UP,
	Noun.DOWN,
	Noun.OUT
]

const NOUN = {
	"NORT": Noun.NORTH,
	"SOUT": Noun.SOUTH,
	"EAST": Noun.EAST,
	"WEST": Noun.WEST,
	"UP": Noun.UP,
	"DOWN": Noun.DOWN,
	"LEAV": Noun.LEAVES,
	"SCUB": Noun.DIVING_GEAR,
	"DIVI": Noun.DIVING_GEAR,
 	"MASK": Noun.WEREWOLF_MASK,
	"HOLE": Noun.DANGEROUS_HOLE,
	"TANK": Noun.TANK,
	"WATE": Noun.TANK,
	"CHAN": Noun.CHANDELIER,
	"MATT": Noun.MATTRESS,
	"BED": Noun.MATTRESS,
	"SLEEP": Noun.SLEEP,
 	"TADP": Noun.TADPOLE,
	"FISH": Noun.TADPOLE,
	"PHIA": Noun.PHIAL,
	"LIQU": Noun.PHIAL,
	"ACID": Noun.PHIAL,
	"FROG": Noun.FROG,
	"GARL": Noun.GARLIC,
 	"WEIG": Noun.WEIGHT,
	"KEEP": Noun.WEIGHT,
	"TRAP": Noun.TRAPDOOR,
	"BOLT": Noun.BOLT,
	"CARP": Noun.CARPET,
	"MIRR": Noun.MIRROR,
	"BRAS": Noun.KEY,
	"KEY": Noun.KEY,
 	"RENO": Noun.PORTRAIT,
	"PAIN": Noun.PORTRAIT,
	"PICT": Noun.PORTRAIT,
	"PORT": Noun.PORTRAIT,
	"SAFE": Noun.SAFE,
	"DOOR": Noun.DOOR,
	"HUGE": Noun.DOOR,
 	"MUMM": Noun.MUMMY,
	"GOLD": Noun.GOLDEN_SCEPTRE,
	"SCEP": Noun.GOLDEN_SCEPTRE,
	"DRAC": Noun.DRACULA,
	"VAMP": Noun.DRACULA,
	"WERE": Noun.WEREWOLF,
	"FLOO": Noun.FLOOR,
	"CAKE": Noun.CAKE,
	"EAT-": Noun.CAKE,
	"BUN": Noun.BUN,
	"EM-T": Noun.BUN,
	"NOTE": Noun.NOTE,
	"HOME": Noun.HOME,
	"RAIN": Noun.RAIN,
	"CRYS": Noun.CRYSTAL_ORC,
	"ORC": Noun.CRYSTAL_ORC,
	"KNOC": Noun.KNOCKER,
	"BELL": Noun.BELL,
	"BRAC": Noun.BRACELET,
	"SILV": Noun.BRACELET,
	#"MASK": 42,  # Must be a bug
	"WALL": Noun.WALL,
	"BANN": Noun.BANN,
 	"STAI": Noun.STAIRS,
	"BUTT": Noun.BUTTON,
	"BIKE": Noun.BIKE,
	"EXER": Noun.BIKE,
	"BICY": Noun.BIKE,
	"MILE": Noun.MILEAGE,
	"WIND": Noun.WINDOW,
	"ROOM": Noun.ROOM,
 	"WITC": Noun.WITCH,
	"CAUL": Noun.CAULDRON,
	"GATE": Noun.GATE,
	"OUT": Noun.OUT,
	"SHED": Noun.SHED,
	"CHUT": Noun.CHUTE,
	"IEXPLODE": Noun.IEXPLODE,
	"INVE": Noun.INVENTORY,
}

enum Verb {
	NULL = 0,
	GO = 1,
	GET = 2,
	DROP = 3,
	OPEN = 4,
	CLOSE = 5,
	EAT = 6,
	KILL = 7,
	LOOK = 8,
	BUILD = 9,
	EXERCISE = 10,
	USE = 11,
	SLEEP = 12,
	BREAK = 14,
	REMOVE = 15,
	PUSH = 16,
	EMPTY = 17,
	FRIGHTEN = 18,
	DIG = 19,
	FLY = 20,
	KNOCK = 22,
	RING = 23,
	SLIDE = 24,
	RIDE = 25,
	FIND = 26,
	HOME = 27,
	ABRACADABRA = 28,
	PANIC = 29,
	QUIT = 30,
}

const VERB = {
 	"GO": Verb.GO,
	"WALK": Verb.GO,
	"RUN": Verb.GO,
	"TRAV": Verb.GO,
	"ENTE": Verb.GO,
	"CLIM": Verb.GO,
	"SWIM": Verb.GO,
	"DIVE": Verb.GO,
	"LIE": Verb.GO,
 	"GET": Verb.GET,
	"LIFT": Verb.GET,
	"TAKE": Verb.GET,
	"STEA": Verb.GET,
	"RAIS": Verb.GET,
	"WEAR": Verb.GET,
	"DROP": Verb.DROP,
	"LEAV": Verb.DROP,
 	"THRO": Verb.DROP,
	"PUT": Verb.DROP,
	"GIVE": Verb.DROP,
	"ABAN": Verb.DROP,
	"OPEN": Verb.OPEN,
	"UNLO": Verb.OPEN,
	"CLOS": Verb.CLOSE,
	"LOCK": Verb.CLOSE,
	"EAT": Verb.EAT,
 	"DRIN": Verb.EAT,
	"CONS": Verb.EAT,
 	"KILL": Verb.KILL,
	"ATTA": Verb.KILL,
	"HURT": Verb.KILL,
	"HIT": Verb.KILL,
	"DEST": Verb.KILL,
	"KICK": Verb.KILL,
	"FIGH": Verb.KILL,
 	"EXAM": Verb.LOOK,
	"LOOK": Verb.LOOK,
	"READ": Verb.LOOK,
	"BUIL": Verb.BUILD,
	"MAKE": Verb.BUILD,
	"EXER": Verb.EXERCISE,
	"USE": Verb.USE,
	"SLEE": Verb.SLEEP,
	"BREA": Verb.BREAK,
 	"SMAS": Verb.BREAK,
	"CRAC": Verb.BREAK,
	"UNDO": Verb.REMOVE,
	"LOOS": Verb.REMOVE,
	"TURN": Verb.REMOVE,
	"UNSC": Verb.REMOVE,
	"REMO": Verb.REMOVE,
	"MOVE": Verb.REMOVE,
 	"PUSH": Verb.PUSH,
	"PULL": Verb.PUSH,
	"PRES": Verb.PUSH,
	"EMPT": Verb.EMPTY,
	"POUR": Verb.EMPTY,
	"FRIG": Verb.FRIGHTEN,
	"BOO": Verb.FRIGHTEN,
	"DIG": Verb.DIG,
	"FLY": Verb.FLY,
 	#"TURN": 21,  # Must be a bug
	"KNOC": Verb.KNOCK,
	"RAP": Verb.KNOCK,
	"RING": Verb.RING,
	"SLID": Verb.SLIDE,
	"RIDE": Verb.RIDE,
	"FIND": Verb.FIND,
	"HOME": Verb.HOME,
 	"TOTO": Verb.HOME,
	"THER": Verb.HOME,
	"YOHO": Verb.ABRACADABRA,
	"XYZZ": Verb.ABRACADABRA,
	"PLUG": Verb.ABRACADABRA,
	"ABRA": Verb.ABRACADABRA,
	"HOCU": Verb.ABRACADABRA,
	"PANI": Verb.PANIC,
}

const IGNORED = [
	"FROM","TO","IN","THRO","UNDE","OVER","ARO","AT","ON","THE","AN","A"
]

const ABBREVIATION = {
	"N": [Verb.GO, Noun.NORTH],
	"S": [Verb.GO, Noun.SOUTH],
	"E": [Verb.GO, Noun.EAST],
	"W": [Verb.GO, Noun.WEST],
	"U": [Verb.GO, Noun.UP],
	"D": [Verb.GO, Noun.DOWN],
	"I": [Verb.GET, Noun.INVENTORY],
	"INVE": [Verb.GET, Noun.INVENTORY],
	"Q": [Verb.QUIT, Noun.NULL],
}


static func find_noun(word: String) -> int:
	var w = word.left(4).to_upper()
	var n = NOUN.get(w, 0)
	return n


static func find_verb(word: String) -> int:
	var w = word.left(4).to_upper()
	var v = VERB.get(w, 0)
	return v


static func parse_command(command: String) -> Array:
	var verb: int = 0
	var noun: int = 0
	var raw_parts: PackedStringArray
	var parts: PackedStringArray = PackedStringArray()

	if command.length() <= 4 and command.find(" ") == -1:
		return ABBREVIATION.get(command, [Verb.NULL, Noun.NULL])
	else:
		raw_parts = command.split(" ", false)

	# Drop out ignored words
	for part in raw_parts:
		if part.left(4)  in IGNORED:
			continue
		parts.append(part)

	verb = Vocabulary.find_verb(parts[0])

	if parts.size() > 1:
		noun = Vocabulary.find_noun(parts[1])

	return [verb, noun]
