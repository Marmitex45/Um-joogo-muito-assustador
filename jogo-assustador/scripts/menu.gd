extends Control

@onready var botoes: VBoxContainer = $Botoes
@onready var opçoes: Panel = $Opçoes

func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/fase_1.tscn")


func _on_sair_pressed() -> void:
	get_tree().quit()

func _ready() -> void:
	botoes.visible = true
	opçoes.visible = false

func _on_opçoes_pressed() -> void:
	print("Voce apertou opçoes")
	botoes.visible = false
	opçoes.visible = true


func _on_voltar_pressed() -> void:
	_ready()


func _on_tela_cheia_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
