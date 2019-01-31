extends Node2D

var bar_red = preload("res://assets/UI/barHorizontal_red_mid 200.png")
var bar_green = preload("res://assets/UI/barHorizontal_green_mid 200.png")
var bar_yellow = preload("res://assets/UI/barHorizontal_yellow_mid 200.png")
var bar_texture

func _ready():
	get_node('..//..//EnemyTank').connect('health_changed', self, 'update_healthbar')
	for node in get_children():
		node.hide()
	pass
	
func _process(delta):
	global_rotation = 0
	
func update_healthbar(value):
	bar_texture = bar_green
	if value < 60:
		bar_texture = bar_yellow
	if value < 25:
		bar_texture = bar_red
		
	if value < 100:
		for node in get_children():
			node.show()
			
	$HealthBar.texture_progress = bar_texture
	$HealthBar.value = value