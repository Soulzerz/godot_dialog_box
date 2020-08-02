extends RichTextLabel

var dialog = ["Hello there.", "I see that you have certain interest in me."]
var page = 0

func _ready():
	bbcode_text = dialog[page]
	visible_characters = 0
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		if visible_characters > get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				bbcode_text = dialog[page]
				visible_characters = 0
		else:
			visible_characters = get_total_character_count()

func _on_Timer_timeout():
	visible_characters += 1 
