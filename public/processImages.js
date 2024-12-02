const Jimp = require('jimp');
const path = require('path');
const fs = require('fs');
const splitColor = [2321194495, 1984138239]
1984138239
// 处理图片函数
async function processImage(rawImagePath, processedImagePath) {
  try {
    // 加载原始图片
    const image = await Jimp.read(rawImagePath);
    const width = image.bitmap.width;
    const height = image.bitmap.height;
    
    // 获取第一行的左上角像素的颜色值
    const firstPixelColor = image.getPixelColor(0, 0);
    
    // 用于存储需要保留的列的索引
    const validColumns = [];
    
    let splitCount = 1, spliting = false
    // 扫描第一行，收集与左上角颜色一致的列索引
    for (let x = 0; x < width; x++) {

      if (splitColor.indexOf(image.getPixelColor(x, 0)) >= 0) {
        if (!spliting) {
          spliting = true
          splitCount++
        }
      }
      else {
        validColumns.push(x);
        spliting = false
      }
    }
    
    // 如果有效列为空，说明没有有效列，返回
    if (validColumns.length === 0) {
      console.log(`没有有效列需要处理: ${rawImagePath}`);
      return;
    }
    
    // 创建一个新的空白图像
    const newImage = new Jimp(validColumns.length, height);
    
    // 复制有效列到新图像
    for (let x = 0; x < validColumns.length; x++) {
      const srcX = validColumns[x];
      for (let y = 0; y < height; y++) {
        const color = image.getPixelColor(srcX, y);
        newImage.setPixelColor(color, x, y);
      }
    }
    
    // 修改所有与第一行左上角颜色相同的像素为透明
    for (let x = 0; x < newImage.bitmap.width; x++) {
      for (let y = 0; y < newImage.bitmap.height; y++) {
        if (newImage.getPixelColor(x, y) === firstPixelColor) {
          newImage.setPixelColor(0x00000000, x, y); // 透明色
        }
      }
    }
    
    // 生成新的文件名
    const fileName = path.basename(rawImagePath);
    let newFileName = fileName.replace('spr_raw_', 'spr_');
    newFileName = newFileName.substring(0, newFileName.indexOf('.')) + `_strip0${splitCount}` + newFileName.substring(newFileName.indexOf('.'))
    const newFilePath = path.join(path.dirname(rawImagePath), newFileName);
    
    // 保存处理后的图片
    await newImage.writeAsync(newFilePath);
    console.log(`已处理图片: ${rawImagePath} -> ${newFilePath}`);
  } catch (err) {
    console.error('处理图片时出错:', err);
  }
}

// 扫描目录并处理图片
async function scanAndProcessDirectory(dirPath) {
  try {
    const files = fs.readdirSync(dirPath);
    
    // 遍历目录中的每个文件
    for (const file of files) {
      const rawFilePath = path.join(dirPath, file);
      
      // 检查文件是否以 spr_raw_ 开头，并且目录中没有对应的 spr_ 文件
      if (file.startsWith('spr_raw_')) {
        await processImage(rawFilePath, path.join(dirPath, file.replace('spr_raw_', 'spr_')));
      }
    }
  } catch (err) {
    console.error('扫描目录时出错:', err);
  }
}

// 调用函数处理指定目录
const directoryPath = './undertale';  // 请根据需要替换为你的目录路径
scanAndProcessDirectory(directoryPath);
