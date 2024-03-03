extends MarginContainer

@onready var start_button = $"VBoxContainer/MarginContainer/StartButton"
@onready var close_button = $"VBoxContainer/MarginContainer/Close"
@onready var message_log = $"VBoxContainer/ScrollContainer/MessageLog"


func _ready() -> void:
	pass


func _on_start_button_pressed() -> void:
	start_button.disabled = true
	print_log("Starting room creations")

	# Load data
	print_log("Loading configuration...")
	var room_configuration = JSON.parse_string(FileAccess.get_file_as_string("res://rooms/room_config.json"))

	var generic_script = preload("res://rooms/generic_room.gd")
	var scene = preload("res://rooms/rooms_template.tscn")
	var root = scene.instantiate()

	# Create rooms
	for room in room_configuration:
		print_log("Creating room %s: %s..." % [int(room["id"]), room["title"]])
		var room_node = Room.new()
		room_node.name = "Room%02d" % int(room["id"])

		# Add node to manager
		root.add_child(room_node)
		room_node.owner = root

		if room.get("script", null) != null:
			print_log("  Using spesific room script '%s'..." % room["script"])
			room_node.set_script(load("res://rooms/%s.gd" % room["script"]))
		else:
			print_log("  Using generic room script...")
			room_node.set_script(generic_script)

		room_node.room_title = room["title"]
		room_node.room_description = room["description"]

		# Create exits
		print_log("  Adding exits...")
		for exit_direction in room["exits"]:
			var room_exit = RoomExit.new()
			room_exit.direction = exit_direction
			room_exit.target_room = NodePath("../Room%02d" % int(room["exits"][exit_direction]))
			room_node.room_exits.append(room_exit)

		# Link items
		print_log("  Adding items...")
		for item in room["items"]:
			room_node.room_items.append(load("res://items/%s.tres" % item))

		# Link NPCs
		print_log("  Adding npcs...")
		for npc in room["npcs"]:
			room_node.room_items.append(load("res://npcs/%s.tres" % npc))

	print_log("Saving scene...")
	var _result = scene.pack(root)
	ResourceSaver.save(scene, "res://rooms/rooms.tscn")

	print_log("Done.")
	start_button.visible = false
	close_button.visible = true


func _on_close_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()


func print_log(s: String, eol: String = "\n"):
	message_log.text += s + eol
