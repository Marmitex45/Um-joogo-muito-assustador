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
	get_tree().current_scene.add_child(nova_bala)

func _physics_process(delta):
	var direcao = Input.get_vector("Esquerda", "Direita", "Cima", "Baixo")
	velocity = direcao * velocidade
	move_and_slide()
	if direcao.x != 0:
		$AnimatedSprite2D.flip_h = direcao.x < 0
func tomar_dano():
	atualizar_coraçoes()
	
		
func atualizar_coraçoes():
	for i in range(listacoraçao.size()):
		listacoraçao[i].visible = 1 < vida
