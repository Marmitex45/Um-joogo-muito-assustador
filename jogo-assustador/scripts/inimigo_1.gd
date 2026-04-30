extends Area2D

var vida = 40
var causou_dano = false
@export var player: CharacterBody2D
@export var velocity = 100

func _process(delta):
	
	var direcao = global_position.direction_to(player.global_position)
	if causou_dano:
		direcao *= Vector2(-4,-4)
	position += velocity * delta * direcao

	if direcao.x != 0:
		$AnimatedSprite2D.flip_h = direcao.x < 0

func tomar_dano():
	self.queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.tomar_hit()
