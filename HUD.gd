extends Control

var save_path = "user://save.dat"

func _ready():
	pass # Replace with function body.



func _on_Save_pressed():
	var save_data = {
		"bat_location.x" : 0
		, "bat_location.y" : 0
		, "player_location.x" : 0
		, "player_location.y" : 0
	}
	var bat = get_node("/root/Game/Enemy_Container/Bat")
	var player = get_node("/root/Game/Player_Container/Player")
	save_data["bat_location.x"] = bat.position.x
	save_data["bat_location.y"] = bat.position.y
	save_data["player_location.x"] = player.position.x
	save_data["player_location.y"] = player.position.y
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(save_data)
		print("Saved successfully!")
		print(OS.get_user_data_dir())
	file.close()
	
	
	
func _on_Load_pressed():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var save_data = file.get_var()
			file.close()
			var bat = get_node("/root/Game/Enemy_Container/Bat")
			var player = get_node("/root/Game/Player_Container/Player")
			bat.position.x = save_data["bat_location.x"]
			bat.position.y = save_data["bat_location.y"]
			player.position.x = save_data["player_location.x"]
			player.position.y = save_data["player_location.y"]
			
	
