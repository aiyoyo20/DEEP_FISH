在安装  pytohn 库 pytesseract 前需要先安装 Tesseract并且配置好环境变量
基本使用：  
```
from PIL import Image
import pytesseract

text = pytesseract.image_to_string(Image.open(r'2432.jpg'),lang='chi_sim')
print(text)
```
但是如果图片未经过处理直接识别的话准确率不高。处理的库 pillow、opencv_python  都可以
主要的思路：
生成灰度图------>>二值化------->>降噪（简单的图可省略）--------->>识别

1、例一
在开始识别的时候，前面的所有准备工作都已经做得很好了，图片的呈现也很好，但是识别出来的为空，查询后得到解决办法
![](images/6.png)


以命令行做介绍
`tesseract test.jpg test.txt -l chi_sim+eng -psm 7 --oem 1`
-l chi_sim+eng 指定中文字库和英文字库

--oem 1 --oem 后面的参数 1代表用lstm引擎识别, 0表示用传统引擎识别
tesseract提供了OCR引擎模式。有如下四种
0 =仅限原始Tesseract
1 =只有神经网络LSTM
2 =Tesseract + LSTM
3 =基于可用的默认值


-psm 7 表示告诉tesseract code.jpg图片是一行文本这个参数可以减少识别错误率. 默认为 3。自己测试好像是一样的
 默认的tesseract将一个图片当成一个文档来看。如果只需要指定的区域可以使用不同的分割模式，使用psm参数

>-psm的说明
>
>在网上找到了0-10项的中文说明(另外几项没找到...)，如下：
0：定向脚本监测（OSD） 
1： 使用OSD自动分页 
2 ：自动分页，但是不使用OSD或OCR（Optical Character Recognition，光学字符识别） 
3 ：全自动分页，但是没有使用OSD（默认） 
4 ：假设可变大小的一个文本列。 
5 ：假设垂直对齐文本的单个统一块。 
6 ：假设一个统一的文本块。 
7 ：将图像视为单个文本行。 
8 ：将图像视为单个词。 
9 ：将图像视为圆中的单个词。 
10 ：将图像视为单个字符。

configfile 参数值为tessdata\configs 和 tessdata\tessconfigs 目录下的文件名.

设置字符白名单(只有大小写字母)：

tesseract c.png out -psm 7 -c tessedit_char_whitelist='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
设置字符黑名单(不含数字)：

tesseract c.png out -psm 7 -c tessedit_char_blacklist='0123456789'
设置字符白名单(只含数字)
