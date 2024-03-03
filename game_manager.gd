extends MarginContainer
class_name GameManager

const DEATH_MESSAGES = [
	"Your life is flashing before you..",
 	"You've 'ad it mate!",
 	"Oh dear now look what you've done!",
 	"oops that's torn it!",
 	"Aw what a shame!",
	 "You've mucked it up!",
]

enum State {
	RUN_DAEMON,
	PRINT_INFORMATION,
	POST_ENTER_ROOM,
	WAIT_FOR_INPUT,
	DEATH,
	END,
}

@onready var game_text = $VBoxContainer/MarginContainer/GameText
@onready var command_prompt = $VBoxContainer/MarginContainer2/CommandPrompt

@onready var player: Player = $Player
@onready var room_manager = $RoomManager
@onready var command_manager = $CommandManager
@onready var game_daemon = $GameDaemon

var clock = {
	"hour": 18,
	"minutes": 30
}

var game_state: State = State.RUN_DAEMON

var output_room_description: bool = true
var god_mode: bool = false


func _ready() -> void:
	Console.add_command("goto_room", _debug_goto_room, 1)
	Console.add_command("pick_item", _debug_pick_item, 1)
	Console.add_command("godmode", _debug_godmode, 1)

	command_prompt.grab_focus()

	game_daemon.initialize(self)
	player.initialize(self)
	command_manager.initialize(self)
	room_manager.initialize(self)

	player.current_room = room_manager.get_room("Room01")


func _process(_delta: float) -> void:
	match game_state:
		State.RUN_DAEMON:
			run_daemon_jobs()
		State.PRINT_INFORMATION:
			print_information()
		State.POST_ENTER_ROOM:
			post_enter_room()
		State.WAIT_FOR_INPUT:
			pass  # Handled by signal.
		State.DEATH:
			death()
		State.END:
			pass


func _on_command_prompt_text_submitted(new_text: String) -> void:
	var command: String = new_text.to_upper()
	var result = command_manager.handle_command(command)
	command_prompt.clear()

	if result[0]:
		output_room_description = result[1]  # Some commands don't require room descriptions
		game_state = State.RUN_DAEMON
	else:
		# Handling error?
		pass


func print_information() -> void:
	if output_room_description:
		pprint(player.current_room.room_description)
	output_room_description = true  # Reset state always
	game_state = State.POST_ENTER_ROOM


func post_enter_room() -> void:
	player.current_room._on_enter()
	game_state = State.WAIT_FOR_INPUT


func run_daemon_jobs() -> void:
	# Daemon jobs (things that are dealt with always)
	game_daemon._run_jobs()
	game_state = State.PRINT_INFORMATION


func death() -> void:
	var msg = DEATH_MESSAGES.pick_random()

	game_text.append_text("\n%s You're dead! (Nothing personal you understand)" % msg)
	game_state = State.END


func _debug_goto_room(new_room: String) -> void:
	player.current_room = room_manager.get_room(new_room)
	game_state = State.RUN_DAEMON


func _debug_pick_item(item: String) -> void:
	var picked_item = load("res://Items/%s.tres" % item)
	player.pick_item(picked_item)
	game_state = State.RUN_DAEMON


func _debug_godmode(mode: String) -> void:
	god_mode = mode == "on"
	game_state = State.RUN_DAEMON

## Print a line of text
func lprint(s: String, eol: String = "\n") -> void:
	game_text.append_text("%s%s" % [s, eol])

## Print a paragraph of a text
func pprint(s: String, eol: String = "\n") -> void:
	game_text.append_text("%s%s%s" % [eol, s, eol])


func clprint(c: String, s: String, eol: String = "\n") -> void:
	lprint("[color=%s]%s[/color]" % [c, s], eol)


func cpprint(c: String, s: String, eol: String = "\n") -> void:
	pprint("[color=%s]%s[/color]" % [c, s], eol)
