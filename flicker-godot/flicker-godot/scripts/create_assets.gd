@tool
extends EditorScript

func _run():
	# Create a simple light texture
	var image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	image.fill(Color(1, 0.67, 0.27, 1))
	
	for x in range(32):
		for y in range(32):
			var dx = x - 16
			var dy = y - 16
			var dist = sqrt(dx * dx + dy * dy)
			if dist > 14:
				image.set_pixel(x, y, Color(1, 0.67, 0.27, 0))
	
	var texture = ImageTexture.create_from_image(image)
	ResourceSaver.save(texture, "res://assets/light.png")
	print("Created light texture")
