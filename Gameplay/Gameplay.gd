extends Node2D

var plMeteor := preload("res://Meteor/Meteor.tscn")

onready var meteorSpawn := $MeteorSpawn

func _process(delta):
	if Input.is_action_just_pressed("spawn"):
		for child in meteorSpawn.get_children():
			var meteor := plMeteor.instance()
			meteor.global_position = child.global_position
			get_tree().current_scene.add_child(meteor)
