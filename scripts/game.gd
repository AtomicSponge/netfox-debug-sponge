class_name Game extends Node

func _on_host_button_pressed() -> void:
	NetworkHandler.start_server()

func _on_client_button_pressed() -> void:
	NetworkHandler.start_client()

func _on_disconnect_button_pressed() -> void:
	NetworkHandler.close_connection()
