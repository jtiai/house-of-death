extends Node

const Werewolf = preload("res://npcs/werewolf.tres")
const Mummy = preload("res://npcs/mummy.tres")
const Vampire = preload("res://npcs/vampire.tres")

const OddLeaves = preload("res://items/odd_leaves.tres")
const Garlic = preload("res://items/garlic.tres")
const WerewolfMask = preload("res://items/werewolf_mask.tres")

var gm: GameManager = null


func initialize(game_manager: GameManager):
	gm = game_manager


func _run_jobs() -> void:
	# Adjust the clock
	gm.clock["minutes"] += 1
	if gm.clock["minutes"] > 59:
		gm.clock["hour"] += 1
		if gm.clock["hour"] > 23:
			gm.clock["hour"] = 0

	if gm.clock["hour"] <= 17:
		if Mummy.current_room:
			if randf() < 0.2:
				Mummy.set_room(gm.room_manager.get_random_room())
		elif Vampire.current_room:
			if randf() > 0.8:
				Vampire.set_room(gm.room_manager.get_random_room())
		elif Werewolf.current_room:
			if randf() > 0.8:
				Werewolf.set_room(gm.room_manager.get_random_room())

	if Mummy.current_room == gm.player.current_room:
		if OddLeaves in gm.player.inventory:
			gm.lprint("Grabbing your Tana Leaves, the mummy departs happily")
			Mummy.set_room(null)
			gm.player.use_item(OddLeaves)
		elif randf() < 0.2:
			gm.pprint("The mummy suddenly grabs you...")
			gm.game_state = gm.State.DEATH

	if Werewolf.current_room == gm.player.current_room:
		if WerewolfMask in gm.player.inventory:
			gm.lprint("nThe werewolf is frightened by your mask and runs off")
			Werewolf.set_room(null)
			gm.player.use_item(WerewolfMask)
		elif randf() < 0.2:
			gm.pprint("With a snarl the thing leaps at you...")
			gm.game_state = gm.State.DEATH

	if Vampire.current_room == gm.player.current_room:
		if Garlic in gm.player.inventory:
			gm.lprint("Grabbing your Tana Leaves, the mummy departs happily")
			Vampire.set_room(null)
			gm.player.use_item(Garlic)
		elif randf() < 0.2:
			gm.pprint("The vampire decides to have a snack...")
			gm.game_state = gm.State.DEATH

