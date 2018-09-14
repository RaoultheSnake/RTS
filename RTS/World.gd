extends Navigation

#extends Navigation
#
## Member variables
#const SPEED = 4.0
#
#var camrot = 0.0
#
#var begin = Vector3()
#var end = Vector3()
#var m = SpatialMaterial.new()
#
#var path = []
#var draw_path = true
#
#
#func _process(delta):
#	if (path.size() > 1):
#		var to_walk = delta*SPEED
#		var to_watch = Vector3(0, 1, 0)
#		while(to_walk > 0 and path.size() >= 2):
#			var pfrom = path[path.size() - 1]
#			var pto = path[path.size() - 2]
#			to_watch = (pto - pfrom).normalized()
#			var d = pfrom.distance_to(pto)
#			if (d <= to_walk):
#				path.remove(path.size() - 1)
#				to_walk -= d
#			else:
#				path[path.size() - 1] = pfrom.linear_interpolate(pto, to_walk/d)
#				to_walk = 0
#
#		var atpos = path[path.size() - 1]
#		var atdir = to_watch
#		atdir.y = 0
#
#		var t = Transform()
#		t.origin = atpos
#		t=t.looking_at(atpos + atdir, Vector3(0, 1, 0))
#		get_node("robot_base").set_transform(t)
#
#		if (path.size() < 2):
#			path = []
#			set_process(false)
#	else:
#		set_process(false)
#
#
#func _update_path():
#	var p = get_simple_path(begin, end, true)
#	path = Array(p) # Vector3array too complex to use, convert to regular array
#	path.invert()
#	set_process(true)
#
#	if (draw_path):
#		var im = get_node("draw")
#		im.set_material_override(m)
#		im.clear()
#		im.begin(Mesh.PRIMITIVE_POINTS, null)
#		im.add_vertex(begin)
#		im.add_vertex(end)
#		im.end()
#		im.begin(Mesh.PRIMITIVE_LINE_STRIP, null)
#		for x in p:
#			im.add_vertex(x)
#		im.end()
#
#
#func _input(event):
##	if (event extends InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed):
#	if (event.is_class("InputEventMouseButton") and event.button_index == BUTTON_LEFT and event.pressed):
#		var from = get_node("cambase/Camera").project_ray_origin(event.position)
#		var to = from + get_node("cambase/Camera").project_ray_normal(event.position)*100
#		var p = get_closest_point_to_segment(from, to)
#
#		begin = get_closest_point(get_node("robot_base").get_translation())
#		end = p
#
#		_update_path()
#
#	if (event.is_class("InputEventMouseMotion")):
#		if (event.button_mask&(BUTTON_MASK_MIDDLE+BUTTON_MASK_RIGHT)):
#			camrot += event.relative.x*0.005
#			get_node("cambase").set_rotation(Vector3(0, camrot, 0))
#			print("camrot ", camrot)
#
#
#func _ready():
#	set_process_input(true)
#
#	m.flags_unshaded = true
#	m.flags_use_point_size = true
#	m.albedo_color = Color(1.0, 1.0, 1.0, 1.0)


#const MOTION_SPEED = 160 # Pixels/second
#
#
#func _physics_process(delta):
#	var motion = Vector2()
#
#	if Input.is_action_pressed("move_up"):
#		motion += Vector2(0, -1)
#	if Input.is_action_pressed("move_bottom"):
#		motion += Vector2(0, 1)
#	if Input.is_action_pressed("move_left"):
#		motion += Vector2(-1, 0)
#	if Input.is_action_pressed("move_right"):
#		motion += Vector2(1, 0)
#
#	motion = motion.normalized() * MOTION_SPEED
#
#	move_and_slide(motion)


#above is code from navemesh demo
#basics: movement, building placement
#advanced: unit formations
#expert: types of terrain, 


#camera movement controls
#unit selection controls
#unit movement controls

func _ready():
	set_process_input(true)
	get_node("CamOrigin/Camera/RayCast").set_enabled(false)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

var camera_motion = Vector3()
#if unit hit select it, if right click move units
func _input(event):
	if (event.is_class("InputEventMouseButton") and event.button_index == BUTTON_LEFT and event.pressed):
		var target= get_node("CamOrigin/Camera").project_ray_origin(event.position)
		get_node("CamOrigin/Camera/RayCast").cast_to("target")
		get_node("CamOrigin/Camera/RayCast").set_enabled(true)
		var selected = get_node("CamOrigin/Camera/RayCast").get_collider()
	

		#select intersected unit
	
	if (event.is_class("InputEventMouseButton") and event.button_index == BUTTON_RIGHT and event.pressed):
		var ray = get_node("CamOrigin/Camera").project_ray_origin(event.position)
		#set movement for selected group
		
	#scroll camera
	if event.is_action_pressed("Move_Up"):
		camera_motion += Vector3(0, 0, 1)
	if event.is_action_pressed("Move_Down"):
		camera_motion += Vector3( 0, 0, -1)
	if event.is_action_pressed("Move_Left"):
		camera_motion += Vector3(-1, 0, 0)
	if event.is_action_pressed("Move_Right"):
		camera_motion += Vector3(1, 0, 0)
		
		get_node("CamOrigin").set_translation(camera_motion) 
	 


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
