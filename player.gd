extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 5

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if Input.is_action_just_pressed("player_jump"):
		self.apply_impulse(Vector2(0,0), Vector2(0,-50))
	if Input.is_action_pressed("player_down"):
		print("down bro")
	if Input.is_action_pressed("player_left"):
		self.apply_impulse(Vector2(0,0), Vector2(-speed,0))
	if Input.is_action_pressed("player_right"):
		self.apply_impulse(Vector2(0,0), Vector2(speed,0))
	pass
