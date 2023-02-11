extends Node

signal score_updated(Vector2)

var p1_score := 0
var p2_score := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	print()


func _process(delta: float) -> void:
	pass

func update_score(is_p1: bool) -> void:
	if is_p1:
		p1_score += 1
	else:
		p2_score += 1
	emit_signal("score_updated", Vector2(p1_score, p2_score))
