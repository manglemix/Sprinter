extends ClassicCharacter


export var max_wall_time := 1.0
export var max_wall_run_angle_degrees := 80.0
export var min_speed := 2.0
export var impact_speed := 2.0

onready var _last_slope_angle := floor_max_angle
onready var _wall_time := max_wall_time


func _process(delta):
	if is_equal_approx(floor_max_angle, deg2rad(max_wall_run_angle_degrees)) and is_on_floor() and _wall_time > 0:
		_wall_time -= delta

		if movement_vector.length() < min_speed:
			_wall_time = 0
	
	elif is_equal_approx(floor_max_angle, deg2rad(max_wall_run_angle_degrees)):
		floor_max_angle = _last_slope_angle
		floor_collision = null
		
	elif is_on_wall() and _wall_time > 0:
		floor_max_angle = deg2rad(max_wall_run_angle_degrees)
	
	elif is_on_floor():
		_wall_time = max_wall_time
