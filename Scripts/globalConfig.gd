extends Node

func toggleFullscren(value):
	DisplayServer.window_set_mode(value)

func updateMasterVol(volume):
	AudioServer.set_bus_volume_db(0, linear_to_db(volume))

func updateMusicVol(volume):
	AudioServer.set_bus_volume_db(1, linear_to_db(volume))

func updateSFXVol(volume):
	AudioServer.set_bus_volume_db(2, linear_to_db(volume))
