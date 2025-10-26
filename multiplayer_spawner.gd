extends MultiplayerSpawner

@export var network_player: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Networking_Handler.connect("player_connected", spawn_player)
	Networking_Handler.connect("player_disconnected", delete_player)


func spawn_player(id: int) -> void:
	if !multiplayer.is_server(): return
	
	var player: Node = network_player.instantiate()
	player.name = str(id)
	
	get_node(spawn_path).call_deferred("add_child", player)

func delete_player(id: int) -> void:
	if !multiplayer.is_server(): return
	rpc("_del_player", id)

@rpc("authority", "call_local", "reliable") func _del_player(id: int) -> void:
	print("Deleting node: " + str(id))
	if get_node("../"+str(id)) != null:
		get_node("../"+str(id)).queue_free()
