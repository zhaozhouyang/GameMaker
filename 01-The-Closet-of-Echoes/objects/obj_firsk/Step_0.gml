/// @description Insert description here
// You can write your code in this editor


spd = 1
moving = false
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



if (keyboard_check(vk_space)) {
    obj_closet.shake_time = 40; // 设置抖动时间为2秒（每帧大约60FPS，所以120帧=2秒）
}