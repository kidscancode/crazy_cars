extends Node3D

var car_scene = preload("res://car.tscn")
var vp_scene = preload("res://race_viewport.tscn")

@onready var spawn_points = $track1/SpawnPoints

func _ready():
	Globals.checkpoint_count = $track1/Checkpoints.get_child_count()
	spawn_cars()
	countdown()
	
	# set up gridcontainer
		# 1-2 players: 1 column
		# 2-3 players: 2 columns
	# for each player (number of controllers):
		# instantiate car - car.setup(player_num)
		# instantiate subviewport container w/camera(s), link to car
		# position car at spawn point
		# disable input
		# start countdown
		
func spawn_cars():
	var players = Input.get_connected_joypads()
	if players.size() < 3:
		$GridContainer.columns = 2
	else:
		$GridContainer.columns = 2
	for player in players:
		var car = car_scene.instantiate()
		add_child(car)
		car.setup(player)
		var vp = vp_scene.instantiate()
		$GridContainer.add_child(vp)
		vp.target = car
		vp.chase_camera.target = car.car_mesh
		car.position = spawn_points.get_child(player).global_position
		car.block_input = true
		
func countdown():
	for message in ["3", "2", "1", "go"]:
		await get_tree().create_timer(1).timeout
		get_tree().call_group("huds", "show_message", message)
	get_tree().set_group("cars", "block_input", false)
	$BGMusic.play()
