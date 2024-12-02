// 设定初始状态
if (shake_mode and shake_time <= 0 and shake_state == "") {
    shake_state = "shake_a";  // 开始第一个晃动阶段
    shake_time = shake_default_time_a;
}

if (!shake_mode) {
    shake_time = 0;
    shake_state = "";  // 重置状态
}

if (shake_time > 0) {
	 if (shake_state != "idle" and shake_state != "idle_b" )
	 {
		  var shake_amount = 1;  // 控制抖动的强度（可以调节）

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
	 }
   

    // 减少抖动时间
    shake_time -= 1;

} else if (shake_time == 0) {
    // 当 shake_time 到达 0 时，检查当前状态并切换到下一个阶段
    if (shake_state == "shake_a") {
        // 第一个晃动阶段结束，进入停顿阶段
        shake_state = "idle";
        shake_time = shake_idle;  // 设置停顿时间
    } else if (shake_state == "idle") {
        // 停顿阶段结束，进入第二个晃动阶段
        shake_state = "shake_b";
        shake_time = shake_default_time_b;  // 设置第二个晃动时间
    } else if (shake_state == "shake_b") {
		shake_state = "idle_b";
        shake_time = shake_idle_b;  // 设置第二个晃动时间
        
    } else if (shake_state == "idle_b") {
        // 第二个晃动阶段结束，恢复原始位置
        if (x != original_x || y != original_y) {
            x = original_x;
            y = original_y;
        }
        shake_state = "";  // 完成所有动作，清空状态
    }
}
