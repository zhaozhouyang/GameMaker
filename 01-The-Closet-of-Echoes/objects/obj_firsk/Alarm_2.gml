/// @description Popup
// You can write your code in this editor
// 遍历创建实例
audio_stop_sound(music_id)
music_id = audio_play_sound(snd_popup, 1, true)

var start_x = obj_popup_controller.x;
var start_y = obj_popup_controller.y;

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
var n = array_length(sprites)
// 创建一个数组，包含 0 到 n-1 的所有整数
var randomArray = [];
for (var i = 0; i < n; i++) {
    randomArray[i] = i;  // 初始化数组，从 0 到 n-1
}

// 洗牌算法 (Fisher-Yates Shuffle)
for (var i = n - 1; i > 0; i--) {
    var j = irandom(i);  // 生成一个随机索引 j，范围从 0 到 i
    // 交换 randomArray[i] 和 randomArray[j]
    var temp = randomArray[i];
    randomArray[i] = randomArray[j];
    randomArray[j] = temp;
}

	
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
		
	inst.alarm[0] = 10 + randomArray[i] * 10
	inst.alarm[1] = 600
}

alarm[3] = 600