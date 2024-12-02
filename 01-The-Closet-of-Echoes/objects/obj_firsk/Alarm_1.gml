/// @description Open Closet
// You can write your code in this editor
if (obj_closet.shake_mode) {
	audio_play_sound(snd_open, 1, false)
	obj_closet.shake_mode = false
	switch_count = 0
	audio_stop_sound(music_id)
	obj_closet.sprite_index = spr_closet_dark_open
	
	alarm[7] = 100
	
	

}