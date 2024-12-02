/// @description Insert description here
// You can write your code in this editor


// 设置窗口大小
window_set_size(1100, 990);
dir = 4
switch_count = 0

move_to_target = false

corner_path = [[124, 130], [176, 130]]
corner_path_spr = [spr_frisk_walk_down, spr_frisk_walk_right]
corner_path_wait = [0, 0]

center_path =  [[87, 130], [87, 91], [85, 91], [89, 91]]
center_path_spr = [spr_frisk_walk_left, spr_frisk_walk_up, spr_frisk_idle_left, spr_frisk_idle_right]
center_path_wait = [0, 0, 1, 1]

cur_path = []
cur_path_spr = []
cur_path_wait = []
cur_path_index = 0
next_alarm_index = 0
cur_wait = 0

music_id = audio_play_sound(snd_home, 1, true)

