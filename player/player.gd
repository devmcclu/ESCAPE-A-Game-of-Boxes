extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 5
var jump_height = 200
var is_jumping = false
var is_loaded = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	#Checks if player is loaded to prevent premature block placement
	if is_loaded == false:
		pass
	#Check if player has blocks available to place
	else:
		if $"../".blocks != 0:
			#place block on cursor position when left mouse is clicked
			if Input.is_action_just_pressed("player_place_box"):
				var new_block = load("res://block.tscn").instance()
				$"../".add_child(new_block)
				new_block.position = get_global_mouse_position()
				print("block here")
				#remove block placed from pool of blocks
				$"../".blocks -= 1

func _physics_process(delta):
	#PLayer jumps when jump key pressed
	if Input.is_action_just_pressed("player_jump"):
		#only jump if not jumping
		if self.is_jumping == false:
			self.is_jumping = true
			self.apply_impulse(Vector2(0,0), Vector2(0,-jump_height))
			$"jump_sound".play()
		elif self.is_jumping == true:
			print("why")
			pass
	#Set impluse on player to move when left or right movement keys pressed
	if Input.is_action_pressed("player_left"):
		self.apply_impulse(Vector2(0,0), Vector2(-speed,0))
	if Input.is_action_pressed("player_right"):
		self.apply_impulse(Vector2(0,0), Vector2(speed,0))
	
	if Input.is_action_just_pressed("restart_level"):
		get_tree().reload_current_scene()

func _on_player_body_entered(body):
	#allow player to jump when touching floor
	if body.is_in_group("floor"):
		print("floor")
		self.is_jumping = false


func _on_Area2D_area_entered(area):
	get_tree().change_scene($"../".next_level)
	print("winner winner")
	pass # replace with function body


func _on_wait_timer_timeout():
	self.is_loaded = true
	pass # replace with function body
