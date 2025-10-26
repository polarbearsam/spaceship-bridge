extends Node

signal player_connected(peer_id)
signal player_disconnected(peer_id)

@export var ip_address: String = "localhost"
@export var port: int = 2010
@export var max_clients: int = 5

var peer: ENetMultiplayerPeer

func _ready() -> void:
	multiplayer.peer_connected.connect(_player_connected)
	multiplayer.peer_disconnected.connect(_player_disconnected)
	multiplayer.connected_to_server.connect(_server_connected)
	multiplayer.connection_failed.connect(_connection_failed)
	multiplayer.server_disconnected.connect(_server_disconnected)

func _player_connected(peer_id: int) -> void:
	if !multiplayer.is_server(): return
	print("Player " + str(peer_id) + " connected!")
	player_connected.emit(peer_id)

func _player_disconnected(peer_id: int) -> void:
	if !multiplayer.is_server(): return
	print("Player " + str(peer_id) + " disconnected!")
	player_disconnected.emit(peer_id)

func _server_connected() -> void:
	print("Connected to server!")

func _connection_failed() -> void:
	_remove_multiplayer_peer()
	print("Failed to connect to server!")

func _server_disconnected() -> void:
	_remove_multiplayer_peer()
	print("Server disconnected!")

func _remove_multiplayer_peer():
	multiplayer.multiplayer_peer = null

func start_server() -> void:
	print("Starting Server!")
	peer = ENetMultiplayerPeer.new()
	peer.create_server(port, max_clients)
	multiplayer.multiplayer_peer = peer
	print("Server started on " + ip_address + ":" + str(port))

func start_client() -> void:
	print("Attempting to connect to " + ip_address + ":" + str(port))
	peer = ENetMultiplayerPeer.new()
	if peer.create_client(ip_address, port) == Error.OK:
		multiplayer.multiplayer_peer = peer
		print("Connecting...")
	else:
		print("Failed to create client!")
	
