extends Node

var IP_ADDRESS: String = "127.0.0.1"
var PORT: int = 42069

##  Start the multiplayer server and trigger a new game
func start_server() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, 4)
	multiplayer.multiplayer_peer = peer
	EventBus.StartGame.emit()

##  Start the multiplayer client and trigger a new game
func start_client() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer
	EventBus.StartGame.emit()

##  Close network connection
func close_connection() -> void:
		#  This line works fine for hosting
		multiplayer.multiplayer_peer = OfflineMultiplayerPeer.new()
		#  Uncomment above and use this line for the original error
		#multiplayer.multiplayer_peer.close()
