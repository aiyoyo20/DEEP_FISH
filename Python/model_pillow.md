# Pillow
## 调整大小
按宽度缩放
这是一个使用 Pillow 模块来调整图片大小的基本脚本：
```
from PIL import Image

basewidth = 300
img = Image.open('fullsized_image.jpg')
wpercent = (basewidth / float(img.size[0]))
hsize = int((float(img.size[1]) * float(wpercent)))
img = img.resize((basewidth, hsize), Image.ANTIALIAS)
img.save('resized_image.jpg')
```
这几行 Python 代码使用 Pillow 将一张图片 （fullsized_image.jpg） 调整为 300 像素的宽度，宽度在变量 basewidth 中设置，高度则与新的宽度成比例。比例高度的计算方法是：确定 300 像素占原宽度 （img.size[0]） 的百分比，然后将原高度（img.size[1]） 乘以该百分比。所得的高度值保存在变量 hsize 中。

如果你需要不同的图片宽度，你可以将 basewidth 改为任何其他数字。另外，请注意，因为我想保留全尺寸的图片 （fullsized_image.jpg），因此我将调整后的图片以一个不同的名称 resized_image.jpg 保存。当然，你不必这么做。如果你想，你可以使用相同的文件名将调整后的图片覆盖全尺寸的图片。

按高度缩放
如果高度是固定的，而宽度是按比例变化的，那也基本差不多，你只需要把东西换一下：
```
from PIL import Image

baseheight = 560
img = Image.open('fullsized_image.jpg')
hpercent = (baseheight / float(img.size[1]))
wsize = int((float(img.size[0]) * float(hpercent)))
img = img.resize((wsize, baseheight), Image.ANTIALIAS)
img.save('resized_image.jpg')
```
注意 basewidth 现在换成了 baseheight，因为高度是固定的。在第三行中，我们在计算高度百分比，所以我们需要 img.size[1] 而不是 img.size[0]。size 属性是一个元组，包含宽度和高度，单位是像素，size[0] 指的是第一个元组元素，也就是宽度，size[1] 是第二个元素，也就是高度。第 4 行也有这样的切换，size[0] 代表宽度，size[1] 代表高度。

## 灰度化
from PIL import Image
Image.open(imgfile).convert('L')

## 二值化
```
def get_bin_table(threshold=115):
    # threshold 为设定的阀值，根据实际情况调节
    '''
    获取灰度转二值的映射table
    0表示黑色,1表示白色
    '''
    table = []
    for i in range(256):
        if i < threshold:
            table.append(0)
        else:
            table.append(1)
    return table

def main():
image = Image.open('RandomPicture.png')
imgry = image.convert('L')
table = get_bin_table()
binary = imgry.point(table, '1')
binary.save('binary.png')
```

## 去噪

