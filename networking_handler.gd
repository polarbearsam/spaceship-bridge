extends Node

#signal player_connected(peer_id, player_info)
#signal player_disconnected(peer_id)
#signal server_disconnected

@export var ip_address: String = "localhost"
@export var port: int = 1965
@export var max_clients: int = 5

var peer: ENetMultiplayerPeer

func _ready() -> void:
	pass
	#multiplayer.peer_connected.connect(_player_connected)
	#multiplayer.peer_disconnected.connect()
	#multiplayer.connected_to_server.connect()
	#multiplayer.connection_failed.connect()
	#multiplayer.server_disconnected.connect()

#func _player_connected(peer_id: int) -> void:
#	player_connected.emit()

func start_server() -> void:
	print("Starting Server!")
	peer = ENetMultiplayerPeer.new()
	peer.create_server(port, max_clients)
	multiplayer.multiplayer_peer = peer
	print("Server started on " + ip_address + ":" + str(port))

func start_client() -> bool:
	print("Connecting to server " + ip_address + ":" + str(port))
	peer = ENetMultiplayerPeer.new()
	peer.create_client(ip_address, port)
	multiplayer.multiplayer_peer = peer
	print("Connected to server!")
	return true
	
