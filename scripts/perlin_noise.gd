extends Node2D

var map_width = 256
var map_height = 128
var noise_scale = 0.1

var water_threshold = 0.4
var beach_threshold = 0.55
var grass_threshold = 0.65
var dirt_threshold = 0.9	

func generate_map():
	var noise = FastNoiseLite.new()
	print(noise)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_map()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
