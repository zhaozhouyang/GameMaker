/// @description Insert description here
// You can write your code in this editor


spd = 1
moving = false

if (move_to_target) {
	target_x = cur_path[cur_path_index][0]
	target_y = cur_path[cur_path_index][1]
	sprite_index = cur_path_spr[cur_path_index]
	
	if (target_x - x > spd * 2) {
		x += spd * 2
	}
	if (target_x - x < - spd * 2) {
		x -= spd * 2
	}
	if (target_y - y > spd * 2) {
		y += spd * 2
	}
	if (target_y - y < - spd * 2) {
		y -= spd * 2
	}

	
	if (point_distance(x, y, target_x,target_y) < 4) {
		if (cur_path_wait[cur_path_index] == 1 && cur_wait < 50) {
			cur_wait++
		} else {
			cur_wait = 0
			cur_path_index++
			if (cur_path_index == array_length(cur_path)) {
				move_to_target = false
				cur_path_index = 0
				alarm[next_alarm_index] = 50
			}
		}
	}
} else {
	if (keyboard_check(vk_shift)) {
		spd = spd * 2
	}

	if (keyboard_check(ord("Z"))) {
		if (x >= 7 and x <= 41 and y >= 40 and y <= 64) {
			alarm[0] = 2

		
		}
		if (x >= 108 and x <= 140 and y >= 40 and y <= 60) {
			alarm[1] = 2
		}	
		show_debug_message(x)
		show_debug_message(y)
	}

	if (keyboard_check(vk_left)) {
		sprite_index = spr_frisk_walk_left
		x -= spd
		dir = 1
		moving = true
	}
	if (keyboard_check(vk_right)) {
		sprite_index = spr_frisk_walk_right
		x += spd
		dir = 2
		moving = true
	}
	if (keyboard_check(vk_up)) {
		sprite_index = spr_frisk_walk_up
		y -= spd
		dir = 3
		moving = true
	}
	if (keyboard_check(vk_down)) {
		sprite_index = spr_frisk_walk_down
		y += spd
		dir = 4
		moving = true
	}

	if (!moving) {
		switch (dir) {
			case 0: 
				sprite_index = spr_frisk_idle_down
				break
			case 1:
				sprite_index = spr_frisk_idle_left
				break
			case 2:
				sprite_index = spr_frisk_idle_right
				break
			case 3:
				sprite_index = spr_frisk_idle_up
				break
			case 4:
				sprite_index = spr_frisk_idle_down
				break
		}
	}
}



