@tool
extends easy_move
class_name spawner

@export var mobScene: PackedScene
@export var spawnRate = 4
var spawnTick = 0;
var mobsSpawned = 0;
var mobsSpawnedThreshold = 2;

@onready var parent = $".."

@export var radius = 100.0:
	set(new_radius):
		radius = new_radius
		queue_redraw()

func _draw():
	draw_circle(Vector2(0,0), radius, Color.CRIMSON)
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawnMob():
	var mob:enemy = mobScene.instantiate()
	mob.currentPosition = currentPosition
	parent.add_child(mob);
	print("Spawned new mob")
	mobsSpawned+=1
	
	if(mobsSpawned == mobsSpawnedThreshold):
		queue_free()
	pass

func onPlayerMove():
	spawnTick+=1
	if(spawnTick == spawnRate):
		spawnMob()
		spawnTick = 0;
	#print(spawnTick)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	setPosition();
	pass
