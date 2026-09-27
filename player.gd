extends CharacterBody2D

@export var move_speed : float = 100
@export var acceleration : float = 50
@export var braking : float = 20
@export var gravity : float = 500
var move_input_horizon : float
var move_input_updown: float
@export var scene_to_load : PackedScene

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	move_input_horizon = Input.get_axis("move_left", "move_right")
	move_input_updown = Input.get_axis("move_up", "move_down")
	velocity.x = move_input_horizon * move_speed
	velocity.y = move_input_updown * move_speed

	if move_input_horizon != 0:
		velocity.x =lerp(velocity.x, move_input_horizon * move_speed, acceleration)
	else: 
		velocity.x = lerp(velocity.x, 0.0, braking)
		
	if move_input_updown != 0:
		velocity.y =lerp(velocity.y, move_input_updown * move_speed, acceleration)
	else: 
		velocity.y = lerp(velocity.y, 0.0, braking)
		
	move_and_slide()

func increase_score(amount: int):
	PlayerStats.score += amount
	print(PlayerStats.score)
	if PlayerStats.score == 5:
		print ("You win!!! YAY NEXT LEVEL")
		call_deferred("you_win")
		
	if PlayerStats.score == 10:
		print ("Congrats! Thank you for playing :)")
		
		
		
func you_win():
	get_tree().change_scene_to_file("res://Scenes/Level_2.tscn")
#func game_over():
	#get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
		
	
