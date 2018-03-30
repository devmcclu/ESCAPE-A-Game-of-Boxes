extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 5
var jump_height = 150
var is_jumping = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	
	if Input.is_action_just_pressed("player_jump"):
		if self.is_jumping == false:
			$Timer.start()
		else:
			pass
		self.apply_impulse(Vector2(0,0), Vector2(0,-jump_height))
	if Input.is_action_pressed("player_down"):
		print("down bro")
	if Input.is_action_pressed("player_left"):
		self.apply_impulse(Vector2(0,0), Vector2(-speed,0))
	if Input.is_action_pressed("player_right"):
		self.apply_impulse(Vector2(0,0), Vector2(speed,0))
	pass


func _on_Timer_timeout():
	self.is_jumping = false
	pass # replace with function body
