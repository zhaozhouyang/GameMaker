/// @description Switch Light
// You can write your code in this editor


audio_play_sound(snd_switch, 1, false)
audio_stop_sound(music_id)
alarm[4] = -1
if (obj_closet.sprite_index == spr_closet) {
		obj_closet.sprite_index = spr_closet_dark
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_background_dark)
		switch_count++
		if (switch_count >= 3) {
			alarm[4] = 100
		} else {
			music_id = audio_play_sound(snd_memory, 1, true)
		}
} else {
	music_id = audio_play_sound(snd_home, 1, true)
	obj_closet.sprite_index = spr_closet
	obj_closet.shake_mode = false
	layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_background)
}
