extends StaticBody2D

signal hit_ball(bool)

@export var speed := 200
@export var is_p1 := true
@export var color: Color

func _ready() -> void:
	$Sprite2D.self_modulate = color

func _physics_process(delta: float) -> void:
	# var x:= (1 if Input.is_action_pressed("move_right") else 0) + (-1 if Input.is_action_pressed("move_left") else 0)
	var y := (1 if Input.is_action_pressed("move_down_" + ("p1" if is_p1 else "p2")) else 0) + (-1 if Input.is_action_pressed("move_up_" + ("p1" if is_p1 else "p2")) else 0)
	var dir := Vector2(0, y)
	var info: KinematicCollision2D = move_and_collide(speed * dir)
	if info and info.get_collider().is_in_group("Ball"):
		info.get_collider().last_is_p1 = is_p1
		info.get_collider().set_color(color)
		emit_signal("hit_ball", is_p1)
