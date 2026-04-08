extends CharacterBody2D
var velocidade = PlayerData.velocidade

func _physics_process(delta):
	var direcao = Input.get_vector("Esquerda", "Direita", "Cima", "Baixo")
	velocity = direcao * velocidade
	move_and_slide()
	if direcao.x != 0:
		$AnimatedSprite2D.flip_h = direcao.x < 0
