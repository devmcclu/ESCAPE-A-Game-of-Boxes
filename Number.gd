extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#Get number of blocks from level node
	self.text = str($"../../../../../".blocks)
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	self.text = str($"../../../../../".blocks)
	pass
