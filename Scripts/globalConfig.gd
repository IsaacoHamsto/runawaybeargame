extends Node

func toggleFullscren(value):
	DisplayServer.window_set_mode(value)

func updateMasterVol(volume):
	AudioServer.set_bus_volume_db(0, volume)

func updateMusicVol(volume):
	AudioServer.set_bus_volume_db(1, volume)

func updateSFXVol(volume):
	AudioServer.set_bus_volume_db(2, volume)
