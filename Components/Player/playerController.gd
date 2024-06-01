extends easy_move
class_name playerController

signal playerMoved;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var newPosition:Vector2 = currentPosition;
	if Input.is_action_just_pressed("move_up"):
		newPosition = Vector2(currentPosition.x, currentPosition.y-1);
	if Input.is_action_just_pressed("move_down"):
		newPosition = Vector2(currentPosition.x, currentPosition.y+1);
	if Input.is_action_just_pressed("move_left"):
		newPosition = Vector2(currentPosition.x-1, currentPosition.y);
	if Input.is_action_just_pressed("move_right"):
		newPosition = Vector2(currentPosition.x+1, currentPosition.y);
	
	if(newPosition != currentPosition):
		currentPosition = newPosition;
		playerMoved.emit();
	pass


func _on_player_character_area_entered(area):
	print("collided")
	pass # Replace with function body.
