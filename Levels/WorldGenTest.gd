extends Node2D

@onready var tilemap = $TileMap
var world = FastNoiseLite.new()
var height = 640
var width = 480

func _ready():
	randomize()
	world.seed = randf() * 100
	world.noise_type = FastNoiseLite.TYPE_PERLIN
	generate_world()

func generate_world():
	for x in range(height):
		for y in range(width):
			var tile = floor(abs(world.get_noise_2d(x, y) * 10))
			#print("x is " + str(x))
			#print("y is " + str(y))
			#print("perlin value of this tile is " + str(tile))
			tilemap.set_cell(0, Vector2i(x - width / 2, y - height / 2), 0, Vector2i(tile, 0), 0)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
