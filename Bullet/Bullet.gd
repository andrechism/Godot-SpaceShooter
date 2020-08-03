extends Area2D

var plRedLaserShot := preload("res://Bullet/LaserRedShot.tscn")

export var speed: float = 500

func _physics_process(delta):
	position.y -= speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Bullet_area_entered(area):
	if area.is_in_group("damageable"):
		var laserRedShot := plRedLaserShot.instance()
		laserRedShot.global_position = global_position
		get_tree().current_scene.add_child(laserRedShot)
		area.damage(1)
		queue_free()
