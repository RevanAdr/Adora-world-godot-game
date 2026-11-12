extends StateNode

@export var player: Player
@export var anims2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if player.player_direction == Vector2.UP:
		anims2d.play("idle_up")
	elif player.player_direction == Vector2.DOWN:
		anims2d.play("idle_down")
	elif player.player_direction == Vector2.RIGHT:
		anims2d.play("idle_right")
	elif player.player_direction == Vector2.LEFT:
		anims2d.play("idle_left")
	else:
		anims2d.play("idle_down")


func _on_unhandled_input(_event: InputEvent) -> void:
	pass


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Run")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	anims2d.stop()
