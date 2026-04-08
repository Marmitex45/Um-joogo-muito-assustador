extends CanvasLayer

@onready var Pause: CanvasLayer = $"."
@onready var label: Label = $Label
@onready var botaoVoltar: Button = $voltar
@onready var botaoMenu: Button = $menu
var is_paussed: bool = false
func _ready() -> void:
	Pause.visible = false
	get_tree().paused = false
	process_mode = Node.PROCESS_MODE_ALWAYS
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		janderson()
func janderson() -> void:
	is_paussed = !is_paussed
	Pause.visible = is_paussed
	get_tree().paused = is_paussed

func _on_voltar_pressed() -> void:
	janderson()


func _on_sair_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
