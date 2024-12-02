/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(ord("X")) and !popup) {
	popup = true
	// 遍历创建实例
	var start_x = x;
	var start_y = y;

	// 矩形区域（移动范围）
	var rect_x1 = 28; // 左上角 x
	var rect_y1 = 80; // 左上角 y
	var rect_x2 = 170; // 右下角 x
	var rect_y2 = 306; // 右下角 y

	// Sprite 列表

	var sprites = [spr_alphys_idle, 
	spr_annoying_dog_idle, 
	spr_asriel_dreemurr_idle, 
	spr_dummies_idle,
	spr_flowey_idle,
	spr_mettaton_idle,
	spr_moster_kid_idle,
	spr_muffet_idle,
	spr_napstablook_idle,
	spr_papyrus_idle,
	spr_ragel_idle,
	spr_sans_idle,
	spr_temmie_idle,
	spr_toriel_handhold,
	spr_undyne_idle
	];
	var col = 5
	var randX = 0.2 * (rect_x2 - rect_x1) / col
	var randY = 0.2 * (rect_y2 - rect_y1) / col
	
	for (var i = 0; i < array_length(sprites); i++) {
	    var inst = instance_create_layer(start_x, start_y, "Instances", obj_popup_sprite);

	    inst.target_sprite = sprites[i];

		inst.image_speed = 0.2;
		
	    inst.rect_x1 = rect_x1 + (i % col) * (rect_x2 - rect_x1) / col;
	    inst.rect_y1 = rect_y1 + floor(i / col) * (rect_y2 - rect_y1) / col;

	    inst.rect_x2 = inst.rect_x1 + randX;
	    inst.rect_y2 =  inst.rect_y1 + randY;
		inst.rect_x1 = inst.rect_x1 - randX
		inst.rect_y1 = inst.rect_y1 - randY
		
		inst.alarm[0] = 10 + i * 10
		inst.alarm[1] = 400
	}
}