extends Node2D

onready var dissipationTimer := $DissipationTimer

export var minRotationRate: float = -50
export var maxRotationRate: float = 50

var dissipationDelay: float = 0.1
var started: bool = false
var rotationRate: float = 0

func _ready():
		rotationRate = rand_range(minRotationRate, maxRotationRate)

func _process(delta):
	
	if !started:
		dissipationTimer.start(dissipationDelay)
		started = true
	if dissipationTimer.is_stopped():
		queue_free()
		

func _physics_process(delta):
	rotation_degrees += rotationRate * delta
