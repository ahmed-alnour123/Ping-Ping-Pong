extends CanvasLayer

var label: Label

func _ready() -> void:
	label = get_node("ScoreLabel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_manager_score_updated(score: Vector2) -> void:
	label.text = "%d:%d" % [score.x, score.y]
