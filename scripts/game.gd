class_name Game extends Node

@onready var Level: Node = $Level

##  Start a new game and if server replicate the level.
func start_game():
	#  We are server
	if multiplayer.is_server():
		load_level.call_deferred(load("res://scenes/levels/level1.tscn"))

##  End the game and close the network connection.
func end_game():
	#  Remove the level
	for node in Level.get_children():
		Level.remove_child(node)
		node.queue_free()
	await get_tree().process_frame
	NetworkHandler.close_connection()

##  Load a level.  Call deferred.
func load_level(scene: PackedScene) -> void:
	for node in Level.get_children():
		Level.remove_child(node)
		node.queue_free()
	Level.add_child(scene.instantiate())

func _ready() -> void:
	EventBus.StartGame.connect(start_game)

func _on_host_button_pressed() -> void:
	NetworkHandler.start_server()

func _on_client_button_pressed() -> void:
	NetworkHandler.start_client()

func _on_disconnect_button_pressed() -> void:
	end_game()
