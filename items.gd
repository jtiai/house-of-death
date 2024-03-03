extends Object
class_name Items

const ITEM = {
	1 : "odd leaves",
	2 :	"scuba diving gear",
	3 :	"werewolf mask",
	4 : "There is now a dangerous hole in the  stairs.",

	6 : "High above there is a chandelier",

	8 : "mattress",
	9 : "expensive chandelier",
	10:	"tadpole",
	11:	"phial of liquid",

	12: "frog",
	13: "garlic",
	14: "weights",



	18: "big rusty key",
	19: "portrait",
	20: "Sorry, safe removed during alterations",
	21: "The huge door",

	23:	"There is a mummy here",
	24: "golden sceptre",
	25: "Count Dracula stands here",
	26: "There is nasty looking werewolf",

	28: "cake iced with 'EAT-ME'",
	29:	"EM-TAE bun",
	30: "Somewhere over the rainbow.",
	31:	"Crystal of Orc",
	32: "There is a closed door",

	34: "There is a brass door knocker",
	35: "There is a bell push",
	36: "bracelet",
}

## Key = item id, value = room id
const INITIAL_ITEM_LOCATIONS = {
	1: 3,
	2: 9,
	3: 7,
	6: 21,
	8: 36,
	10: 24,
	14: 33,
	18: 42,
	19: 44,
	21: 46,
	23: 49,
	24: 48,
	25: 50,
	26: 53,
	28: 16,
	29: 16,
	32: 1,
	34: 1,
	35: 1,
	36: 47,
}

const WEIGHT = [
	6,25,9,0,0,0,0,50,20,10,
	8,12,11,60,0,0,0,3,30,1,
	0,0,0,20,0,0,0,10,9,0,
	15,0,0,0,0,3
]
