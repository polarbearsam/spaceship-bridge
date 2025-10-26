extends Control


func _on_server_pressed() -> void:
	Networking_Handler.start_server()


func _on_client_pressed() -> void:
	Networking_Handler.start_client()


func _on_port_text_changed(new_text: String) -> void:
	Networking_Handler.port = int(new_text)


func _on_ip_text_changed(new_text: String) -> void:
	Networking_Handler.ip_address = new_text
