extends ColorRect

onready var inventory_button = get_node("MarginContainer/HBoxContainer/MenuButtons/Buttons/inventory")
onready var save_button = get_node("MarginContainer/HBoxContainer/MenuButtons/Buttons/save")
onready var load_button = get_node("MarginContainer/HBoxContainer/MenuButtons/Buttons/load")
onready var exit_button = get_node("MarginContainer/HBoxContainer/MenuButtons/Buttons/exit")
onready var item_list = get_node("MarginContainer/HBoxContainer/Content/MarginContainer/ItemList")
var icon


func _ready():
	
	var icon_img = Image.new()
	var icon_tex = ImageTexture.new()
	
	icon_img.load("res://icon.png")
	
	icon_tex.create_from_image(icon_img)
	
	icon = icon_tex
	
	for i in range(3):
		
		item_list.add_item(str("Item " + String(i+1)) + "Descrição", icon)
	
	pass
	
func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_cancel"):
		
		get_tree().paused = !is_visible()
		visible = !is_visible()
		inventory_button.grab_focus()
		
	if inventory_button.has_focus():
		$MarginContainer/HBoxContainer/Content/MarginContainer/ColorRect.color = Color(1, 0, 0, 1)
	elif save_button.has_focus():
		$MarginContainer/HBoxContainer/Content/MarginContainer/ColorRect.color = Color(0, 1, 0, 1)
	elif load_button.has_focus():
		$MarginContainer/HBoxContainer/Content/MarginContainer/ColorRect.color = Color(0, 0, 1, 1)
	elif  exit_button.has_focus():
		$MarginContainer/HBoxContainer/Content/MarginContainer/ColorRect.color = Color(1, 0, 1, 1)
		
func _on_exit_pressed():
	get_tree().quit()

func _on_ItemList_focus_entered():
	item_list.select(0)

func _on_ItemList_focus_exited():
	item_list.unselect_all()
