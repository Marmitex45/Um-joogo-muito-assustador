extends CharacterBody2D
var velocidade = PlayerData.velocidade
var listacoraçao : Array[TextureRect]
var vida = PlayerData.vida
@export var projetil : PackedScene
@onready var ponta_arma = $Emissorbala

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Atirar"):
		disparar()

func disparar():
	var nova_bala = projetil.instantiate()
	
	nova_bala.global_position = ponta_arma.global_position
	print(ponta_arma.global_position,nova_bala.global_position)
	nova_bala.direcao = (get_global_mouse_position() - self.global_position).normalized()
	nova_bala.look_at(get_global_mouse_position())
	get_tree().current_scene.add_child(nova_bala)

func _physics_process(delta):
	var direcao = Input.get_vector("Esquerda", "Direita", "Cima", "Baixo")
	velocity = direcao * velocidade
	look_at(get_global_mouse_position())
	if direcao.x != 0:
		$AnimatedSprite2D.flip_h = direcao.x < 0
	move_and_slide()
	
func tomar_hit():
	PlayerData.vida -= 1
	atualizar_coraçoes()
	
		
func atualizar_coraçoes():
	for i in range(listacoraçao.size()):
		if (i+1 > PlayerData.vida):
			listacoraçao[i].visible = false
		else:
			listacoraçao[i].visible = true


#func tomar_hit():
	#self.queue_free()
