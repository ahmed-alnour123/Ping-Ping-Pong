extends RigidDynamicBody2D

@export var speed := 400
@export var start_direction: Vector2
@export var color: Color

var last_is_p1 := true

func _ready() -> void:
	linear_velocity = start_direction.normalized() * speed
	$Sprite2D.self_modulate = color

func _on_ball_body_exited(body: Node) -> void:
	var rot = randf_range(-PI/8, PI/8)
	linear_velocity = linear_velocity.rotated(rot).normalized() * speed

func set_color(color: Color) -> void:
	$Sprite2D.self_modulate = color
