extends Node2D

@export var velocidade := 1000
var direcao = Vector2.ZERO

func _process(delta: float) -> void:
	position += velocidade * delta * direcao
