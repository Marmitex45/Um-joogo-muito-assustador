extends CharacterBody2D

var vida = 40
var causou_dano = false
@export var player: CharacterBody2D

func _physics_process(delta):
	
	var direcao = global_position.direction_to(player.global_position)
	if causou_dano:
		direcao *= Vector2(-4,-4)
	velocity = direcao * 300.0

	if direcao.x != 0:
		$AnimatedSprite2D.flip_h = direcao.x < 0
	move_and_slide()
