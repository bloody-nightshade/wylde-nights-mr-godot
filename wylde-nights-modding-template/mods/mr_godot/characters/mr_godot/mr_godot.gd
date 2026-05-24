class_name MrGodot extends PathCharacter

const PATH_1: Array[GameConstants.CameraID] = [
	GameConstants.CameraID.CAM_4,
	GameConstants.CameraID.CAM_5,
	GameConstants.CameraID.CAM_3,
	GameConstants.CameraID.LEFT_DOOR,
]

const PATH_2: Array[GameConstants.CameraID] = [
	GameConstants.CameraID.CAM_4,
	GameConstants.CameraID.CAM_5,
	GameConstants.CameraID.CAM_8,
	GameConstants.CameraID.RIGHT_DOOR,
]

func _ready() -> void:
	set_path()
	
	super() # Super duper important in getting their _ready() code to work.


func reset() -> void:
	super() # Super duper important in getting their reset code to work.
	
	set_path()

func set_path() -> void:
	path = [PATH_1, PATH_2].pick_random() # Just a simple way of picking a random out of 2 things

func attempt_attack(office_position: GameConstants.OfficePosition) -> void: # EXTREMELY SUPER DUPER VERY IMPORTANT IF YOU WANT YOUR CHARACTER TO ACTUALLY ATTACK
	super(office_position)
	
	if OfficeNightWatchManager.instance.is_door_open(office_position):
		attack(office_position, "default")
	else:
		failed_attack(office_position)
