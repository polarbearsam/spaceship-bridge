extends CharacterBody2D


@export var speed = 300.0
var new_pos : Vector2

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	#pass

#@rpc("any_peer", "call_remote", "reliable")
#func update_vec(vector: Vector2) -> void:
#	print("Function Called!")
#	if !multiplayer.is_server(): return
#	if multiplayer.get_remote_sender_id() != name.to_int():
#		print("Wrong player!")
#		print(multiplayer.get_remote_sender_id())
#		print(name.to_int())
#		return
#	velocity = vector * speed
#	move_and_slide()
#	print("Sending updated position")
#	update_pos.rpc(position)

#@rpc("authority", "call_remote", "unreliable_ordered")
#func update_pos(pos: Vector2) -> void:
#	print("Received new position")
#	new_pos = pos

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
	#if name.to_int() != multiplayer.get_unique_id():
	#	if new_pos:
	#		print("Interpolating")
	#		position = position.lerp(new_pos, delta)
	#else:
		var vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		if vector != Vector2(0,0):
	#		print("Moving!")
	#		update_vec.rpc(vector)
			velocity = vector * speed
			move_and_slide()
