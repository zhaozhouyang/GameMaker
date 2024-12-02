/// @description Insert description here
// You can write your code in this editor
// 移动到目标点
if (target_x >= 0) {
	if (sprite_index == -1) {
		sprite_index = target_sprite
	}
	var spd = 2
	var dx = target_x - x;
	var dy = target_y - y;
	var distance = point_distance(x, y, target_x, target_y);

	if (distance > spd) {
	    var angle = point_direction(x, y, target_x, target_y);
	    x += lengthdir_x(spd, angle);
	    y += lengthdir_y(spd, angle);
	}
	depth = -y;	
}

if (fade and image_alpha > 0) {
	image_alpha -= 0.01
}
