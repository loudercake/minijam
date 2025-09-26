extends CharacterBody2D

@onready var sprite = $Sprite
@onready var anim_player = $AnimationPlayer

signal infected_germ

var germ_sprite = load("res://germ.png")
var also_germ_sprite = load("res://also germ.png")

@export var infected := false

func _ready() -> void:
	anim_player.current_animation = "anim"

func _process(delta: float) -> void:
	if infected:
		sprite.texture = germ_sprite
	else:
		sprite.texture = also_germ_sprite
	sprite.offset.x = randi_range(-1,1)
	sprite.offset.y = randi_range(-1,1)

func _physics_process(delta: float) -> void:
	if infected:
		velocity = get_global_mouse_position() - position 
		move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if !infected:
		infected = true
		emit_signal("infected_germ")
