extends Node2D

@onready var camera = $Camera2D
@onready var bg_color = $ColorRect

var infected := 0

func _ready() -> void:
	for child in get_children():
		child.connect("infected_germ", _on_germ_infected_germ)

func _process(delta: float) -> void:
	if infected > 99:
		camera.offset = Vector2(randf_range(2,-2),randf_range(2,-2))

func _on_germ_infected_germ() -> void:
	infected += 1
	print(infected)
	var tween = get_tree().create_tween()
	if infected == 10:
		tween.tween_property(camera, "zoom", camera.zoom - Vector2(0.1, 0.1), 0.3)
		tween.tween_property(bg_color, "color", Color("8c8e86ff") , 1.5)
	if infected == 50:
		tween.tween_property(camera, "zoom", camera.zoom - Vector2(0.05, 0.05), 0.3)
		tween.tween_property(bg_color, "color", Color("6e4847ff") , 1.9)
	if infected == 100:
		tween.tween_property(camera, "zoom", camera.zoom - Vector2(0.02, 0.02), 0.3)
		tween.tween_property(bg_color, "color", Color("522745ff") , 1.9)
	if infected == 150:
		tween.tween_property(camera, "zoom", camera.zoom - Vector2(0.02, 0.02), 0.3)
		tween.tween_property(bg_color, "color", Color("9c4682ff") , 1.9)
