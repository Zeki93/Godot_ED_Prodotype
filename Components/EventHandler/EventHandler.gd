extends Node2D

@onready var player:playerController = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_player_moved():
	get_tree().call_group("spawners", "onPlayerMove")
	get_tree().call_group("enemies", "onPlayerMove", player)
	pass # Replace with function body.
