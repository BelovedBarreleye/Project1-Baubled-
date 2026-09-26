extends CharacterBody2D

@export var move_speed : float = 100
@export var acceleration : float = 50
@export var braking : float = 20
@export var gravity : float = 500
var move_input_horizon : float
var move_input_updown: float

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	move_input_horizon = Input.get_axis("move_left", "move_right")
	move_input_updown = Input.get_axis("move_up", "move_down")
	velocity.x = move_input_horizon * move_speed
	velocity.y = move_input_updown * move_speed

	if move_input_horizon != 0:
		velocity.x =lerp(velocity.x, move_input_horizon * move_speed, acceleration * delta)
	else: 
		velocity.x = lerp(velocity.x, 0.0, braking * delta)
		
	if move_input_updown != 0:
		velocity.y =lerp(velocity.y, move_input_updown * move_speed, acceleration * delta)
	else: 
		velocity.y = lerp(velocity.y, 0.0, braking * delta)
		
	move_and_slide()


func _on_rock_a_body_entered(body: Node2D) -> void:
	print ("IN")


func _on_rock_a_body_exited(body: Node2D) -> void:
	print ("OUT")


func _on_rock_b_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
