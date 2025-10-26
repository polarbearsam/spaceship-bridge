extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Networking_Handler.connect("server_disconnected", _server_disconnected)


func _server_disconnected():
	get_tree().change_scene_to_file("res://menu.tscn")
