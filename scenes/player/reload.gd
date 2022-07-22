extends Node2D

signal reload_finished

onready var _initial_progress_indicator_x: float = $HorizontalBar.transform.origin.x
onready var _final_progress_indicator_x: float = (
	$HorizontalBar.transform.origin.x
	+ $HorizontalBar.polygon[1].x
	- $ProgressIndicator.polygon[1].x
)


func _ready():
	visible = false


func run_reload(reload_time_seconds: float):
	$ProgressTween.remove_all()
	$ProgressTween.interpolate_property(
		$ProgressIndicator,
		"transform:origin:x",
		_initial_progress_indicator_x,
		_final_progress_indicator_x,
		reload_time_seconds,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	$ProgressTween.start()


func stop_reload():
	$ProgressTween.remove_all()
	visible = false


func _on_ProgressTween_tween_started(_object: Object, _key: NodePath):
	visible = true


func _on_ProgressTween_tween_completed(_object: Object, _key: NodePath):
	visible = false
	emit_signal("reload_finished")
