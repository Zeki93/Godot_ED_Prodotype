@tool
extends Node2D

class_name easy_move

@export var currentPosition: Vector2:
	set(new_position):
		currentPosition = new_position
		setPosition()
		
var tileSize = 128;

func setPosition():
	self.position.x = currentPosition.x*tileSize
	self.position.y = currentPosition.y*tileSize

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	setPosition()
	pass
