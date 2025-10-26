extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Networking_Handler.connect("server_connecting", _server_connecting)


func _server_connecting():
	get_tree().change_scene_to_file("res://world.tscn")
