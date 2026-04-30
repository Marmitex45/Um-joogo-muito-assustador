extends Node2D

@export var velocidade := 1000
var direcao = Vector2.ZERO

func _process(delta: float) -> void:
	position += velocidade * delta * direcao

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Inimigos"):
		area.tomar_dano()
		self.queue_free()
