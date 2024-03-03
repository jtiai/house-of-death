extends Resource
class_name RoomExit

## Direction of movement
@export var direction: String = ""

## Target room of movement
@export_node_path("Room") var target_room
