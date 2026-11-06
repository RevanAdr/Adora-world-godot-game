extends StateNode

@export var player : Player
@export var anims2d : AnimatedSprite2D
@export var speed : int = 125

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction : Vector2 = GameInputEvents.movement_input()
	
	if direction == Vector2.UP:
		anims2d.play("run_up")
	elif direction == Vector2.DOWN:
		anims2d.play("run_down")
	elif direction == Vector2.LEFT:
		anims2d.play("run_left")
	elif direction == Vector2.RIGHT:
		anims2d.play("run_right")
		
	if direction != Vector2.ZERO:
		player.player_direction = direction
		
	player.velocity = direction * speed
	player.move_and_slide()


func _on_unhandled_input(_event: InputEvent) -> void:
	pass


func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	anims2d.stop()
