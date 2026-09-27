extends Area2D
@export var move_direction : Vector2
@export var move_speed : float = 20
@onready var start_pos : Vector2 = global_position
@onready var target_pos : Vector2 = global_position + move_direction

var rotate_speed : float = 3.0
var bob_height : float = 5.0
var bob_speed : float = 5.0

#func _physics_process(delta):
# Move steadily toward the current target position
	#global_position = global_position.move_toward(target_pos, move_speed * delta)
# When the enemy arrives, swap the target to create a patrol loop
	#if global_position == target_pos:
		#if target_pos == start_pos:
			#target_pos = start_pos + move_direction
		#else:
			#target_pos = start_pos
			
func _physics_process(delta):
	var time = Time.get_unix_time_from_system()
	var y_pos = ((1 + sin(time * bob_speed)) / 2) * bob_height
	global_position.y = start_pos.y - y_pos


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
			return
	print ("Fish Caught!")
	body.increase_score(1)
	queue_free()
	
