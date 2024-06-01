extends easy_move
class_name enemy

@export var mobMoveRate = 2
var mobMoveTick = 0;
var enemyId = 0;
var numberOfMobs = 0;


@onready var richTextLabel = $RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemies", true)
	enemyId = enemyVariables.enemyIdNextVal()
	setNumberOfMobs(1)
	pass # Replace with function body.

func setNumberOfMobs(newAmount):
	numberOfMobs = newAmount;
	richTextLabel.set_text(str(numberOfMobs));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(is_in_group("enemies"))
	pass
	
func moveMob(player:playerController):
	var newPosition = []
	
	if(player.currentPosition.x != currentPosition.x):
		if(player.currentPosition.x > currentPosition.x):
			newPosition.push_front( Vector2(currentPosition.x+1, currentPosition.y))
		else:
			newPosition.push_front( Vector2(currentPosition.x-1, currentPosition.y))
	
	if(player.currentPosition.y != currentPosition.y):
		if(player.currentPosition.y > currentPosition.y):
			newPosition.push_front( Vector2(currentPosition.x, currentPosition.y+1))
		else:
			newPosition.push_front( Vector2(currentPosition.x, currentPosition.y-1))
	
	newPosition.shuffle()
	if(!newPosition.is_empty()):
		currentPosition = newPosition.pop_front()
		newPosition.clear()
	pass


func onPlayerMove(player:playerController):
	mobMoveTick+=1
	if(mobMoveRate == mobMoveTick):
		moveMob(player)
		mobMoveTick = 0
	pass



func _on_area_entered(area):
	print("Mob collided")
	
	if(area is enemy):
		if(area.enemyId > enemyId): #Since two enemies are colliding we need to decide who acts
			return
		
		if(area.numberOfMobs > numberOfMobs):
			queue_free()
			area.setNumberOfMobs(area.numberOfMobs + numberOfMobs)
		else:
			setNumberOfMobs(area.numberOfMobs + numberOfMobs)
			area.queue_free()
	pass # Replace with function body.
