class_name FlowerPot extends StaticBody2D

@export_subgroup("Nodes")
@export var path_follow: PathFollow2D
@export var collision_shelf: CollisionShape2D
@export var collision_ground: CollisionShape2D

@export_subgroup("Settings")
@export var fall_height: float = 10.0
@export var progress_step: float = 3.0
@export var deputy_text: String = "You are brilliant, Detective Snickers! That's how it happened!"
@export var deputy_text2: String = "The victim must have bumped into the shelf and the vase fell on his head!"
@export var deputy_text3: String = "With your brilliant skills of deduction you almost make our job look effortless"

var _should_fall = false
var _on_ground = false

func _ready():
	collision_ground.disabled = true

func _process(delta):
	if _should_fall:
		path_follow.progress = path_follow.progress + progress_step
	if path_follow.progress_ratio == 1 && !_on_ground:
		handle_on_ground()

func interact():
	if !_should_fall:
		fall()

func fall():
	get_parent().remove_child(self)
	path_follow.add_child(self)
	collision_shelf.disabled = true
	collision_ground.disabled = false
	reset_position()
	_should_fall = true

func handle_on_ground():
	_on_ground = true
	#var text_speed = 0.05
	#var text1_time = Utility.calculate_speak_time(deputy_text, text_speed)
	#var text2_time = Utility.calculate_speak_time(deputy_text2, text_speed)
##
	#SpeechSignalBus.deputy_speak.emit(deputy_text, 0.0, 1.5)
	#await get_tree().create_timer(text1_time+0.2).timeout
	#SpeechSignalBus.deputy_speak.emit(deputy_text2, 0.0, 1.5)
	#await get_tree().create_timer(text2_time+0.2).timeout
	#SpeechSignalBus.deputy_speak.emit(deputy_text3, 0.0, 1.5)
	

func reset_position():
	self.position = Vector2.ZERO