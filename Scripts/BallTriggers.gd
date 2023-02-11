extends Node2D

@export var is_p1_trigger := true

func _ready() -> void:
	connect("body_entered", _on_area_entered)
	
func _on_area_entered(area: Node2D) -> void:
	if area.is_in_group("Ball"):
		if area.last_is_p1 and not is_p1_trigger:
			get_parent().get_parent().get_node("GameManager").update_score(true)
#			p1_score += 1
		elif not area.last_is_p1 and is_p1_trigger:
			get_parent().get_parent().get_node("GameManager").update_score(false)
#			p2_score += 1
