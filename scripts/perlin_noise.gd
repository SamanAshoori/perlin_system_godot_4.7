extends Node2D

var map_width = 256
var map_height = 128
var noise_scale = 0.1

var water_threshold = 0.5
var grass_threshold = 0.65
var dirt_threshold = 0.9

@onready var tilemap: TileMapLayer = $TileMapLayer

func generate_map():
	var noise = FastNoiseLite.new()
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	#frequency means the variation of the perlin noise
	noise.frequency = noise_scale	
	
	tilemap.clear()
	
	for x in range(map_width):
		for y in range(map_height):
			var noise_value = noise.get_noise_2d(x,y)
			noise_value = (noise_value + 1) / 2
			
			var tile_pos = Vector2i(x,y)
			var atlas_coord = Vector2i(0,0)
			
			if noise_value < water_threshold:
				atlas_coord = Vector2i(0,1)
			elif noise_value < grass_threshold:
				atlas_coord = Vector2i(0,0)
			elif noise_value < dirt_threshold:
				atlas_coord = Vector2i(1,1)
			else:
				print("ERROR");
				
			tilemap.set_cell(tile_pos,0,atlas_coord)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_map()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_randomise_pressed() -> void:
	generate_map() 
