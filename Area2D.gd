extends Area2D

#this function is called when any body enters this area
func _on_Area2D_body_entered(body):
	#confirm that the body is player
	if body.is_in_group("player"):
		#call kill , assuming that you have defined kill function for player
		body.kill()
