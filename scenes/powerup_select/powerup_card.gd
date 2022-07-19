extends ColorRect

# card_props: PowerupCardProps
signal selected(card_props)


class PowerupCardProps:
	var name: String
	var description: String
	var texture: Texture
	# variant: PowerupVariant
	var variant: int
	var on_selected_callback: FuncRef

	func _init(
		_name: String,
		_description: String,
		_texture: Texture,
		_variant: int,
		_on_selected_callback: FuncRef
	):
		name = _name
		description = _description
		texture = _texture
		variant = _variant
		on_selected_callback = _on_selected_callback


var props: PowerupCardProps

onready var _name_node := find_node("Name") as RichTextLabel
onready var _image_node := find_node("Image") as TextureRect
onready var _description_node := find_node("Description") as RichTextLabel


func _ready():
	assert(_name_node != null)
	assert(_image_node != null)
	assert(_description_node != null)
	assert(props != null)

	_name_node.bbcode_text = str("[center]", props.name, "[/center]")
	_image_node.texture = props.texture
	_description_node.bbcode_text = str(
		"[center]", props.description, "[/center]"
	)


func _on_SelectButton_pressed():
	emit_signal("selected", props)
