extends Popup

var displayButton

var masterSlider
var musicSlider
var sfxSlider

func _ready():
	displayButton = $TabContainer/Video/MarginContainer/GridContainer/DisplayOption
	
	masterSlider = $TabContainer/Audio/MarginContainer/GridContainer/MasterVolumeSlider
	musicSlider = $TabContainer/Audio/MarginContainer/GridContainer/MusicVolumeSlider
	sfxSlider = $TabContainer/Audio/MarginContainer/GridContainer/SFXVolumeSlider

func _on_displayOption_item_selected(index):
	GlobalConfig.toggleFullscren(0 if index==0 else 3)

func _on_masterSlider_value_changed(value):
	GlobalConfig.updateMasterVol(value)

func _on_musicSlider_value_changed(value):
	GlobalConfig.updateMusicVol(value)

func _on_sfxSlider_value_changed(value):
	GlobalConfig.updateSFXVol(value)
