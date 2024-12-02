/// @description Insert description here
// You can write your code in this editor
// 在柜子对象的Step事件中
// 在柜子对象的Step事件中
if (shake_time > 0) {
   var shake_amount = 1; // 控制抖动的强度（可以调节）
    
    // 计算当前的随机偏移
    var shake_x = random_range(-shake_amount, shake_amount);
    var shake_y = random_range(-shake_amount, shake_amount);

    // 记录上一次的偏移，决定是否反向
    if (abs(x + shake_x - original_x) > shake_amount * 2) {
        shake_x = -shake_x;  // 如果偏移太大，反向
    }

    if (abs(y + shake_y - original_y) > shake_amount * 2) {
        shake_y = -shake_y;  // 如果偏移太大，反向
    }

    // 应用新的抖动
    x += shake_x;
    y += shake_y;

    // 保存当前的偏移量，以便反向使用
    last_shake_x = shake_x;
    last_shake_y = shake_y;

    // 减少抖动时间
    shake_time -= 1;
} else if (shake_time == 0 && (x != original_x || y != original_y)) {
    // 如果抖动结束且柜子还没有回到原始位置，恢复原始位置
    x = original_x;
    y = original_y;
}