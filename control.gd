extends Control


func _on_server_pressed() -> void:
	Networking_Handler.start_server()


func _on_client_pressed() -> void:
	Networking_Handler.start_client()
