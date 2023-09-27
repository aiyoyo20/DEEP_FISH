### video display interface 
从接口性能上来看，显示器接口的性能是 DP>HDMI>DVI>VGA。

#### VGA (Video Graphics Array)
！[vga](images/vga.png)

 VGA 传输的是模拟信号，目前已经被主流淘汰。并且是模拟连接，因此当将分辨率推得更高时，由于信号从模拟转换为数字，图像质量会下降。 除非绝对必要，否则请使用其他连接之一而不是 VGA。 

#### DVI (Digital Visual Interface)
![DVI-Connectors](images/DVI-Connectors.jpg)

DVI 端口分为三种类型：

1. DVI-D 是数字格式连接器。 它有 `单链路` 和 `双链路` 两种形式 ，区别在于双链路连接器提供的功率更大，数据传输速率是单链路连接器的两倍。 DVI-D 是最流行的连接器类型，用于将 DVI 卡连接到 LCD 显示器。 对于大屏幕，双链路连接器通常是比单链路连接器更好的选择。

2. DVI-A 是模拟格式连接器。 这是用于将 DVI 卡连接到 CRT 显示器（模拟显示设备）的类型。 尽管信号确实经过了数模转换，但其结果比使用标准 VGA 电缆时的质量更高。

3. DVI-I 是集成格式连接器。 它适用于数字和模拟设备，充当 DVI-D 或 DVI-A 电缆，但不会将纯 DVI-D 输出转换为模拟。 DVI-I 有两种变体——单链路和双链路——并具有 29 针布局以适应多个连接。

#### HDMI (High-Definition Multimedia Interface)
HDMI 能够传输未压缩的视频和未压缩的音频。

HDMI 有不同的规格。 不仅有全尺寸 HDMI（A 型），还有 mini-HDMI（B 型）和微型 HDMI（C 型）。

#### DP (DisplayPort)

DisplayPort 的主要优点是能够通过多流传输 (MST) 输出到多个显示器。


### 软件控制显示器
#### DDC/CI 协议

DDC/CI（Display Data Channel/Command Interface）协议是一种用于计算机与显示器之间通信和控制的标准协议。它允许计算机通过视频连接（如VGA、DVI、HDMI、DisplayPort等）与显示器进行双向通信，并对显示器进行配置和控制。

通过DDC/CI协议，计算机可以向显示器发送命令和请求，以获取和修改显示器的各种参数和设置，例如亮度、对比度、色彩设置、显示模式和几何配置等。同时，显示器也可以向计算机发送状态和信息，如显示器的型号、分辨率、支持的功能等。

DDC/CI协议的实现通常依赖于以下几个组件：

DDC 通道：DDC 通道是通过视频连接传输`DDC/CI`命令和数据的通道。它使用与视频信号共享的一些控制引脚或数据通道来进行通信。

`DDC/CI`命令：`DDC/CI`命令是用于控制和配置显示器的指令集。通过发送特定的命令和参数，计算机可以改变显示器的各种设置。

`DDC/CI`驱动程序和工具：为了使用`DDC/CI`协议与显示器进行通信，计算机需要相应的`DDC/CI`驱动程序和工具。这些驱动程序和工具提供了命令行工具或图形界面工具，使用户能够发送和接收`DDC/CI`命令。

使用`DDC/CI`协议的优点是可以直接通过计算机与显示器进行设置和调整，而无需依赖显示器上的物理按钮操作。这使得在多显示器设置中轻松调整每个显示器的参数成为可能，并提供了更大的灵活性和便利性。

需要注意的是，并非所有显示器都完全支持`DDC/CI`协议，特别是较旧的或低成本的显示器可能不支持或只支持有限的功能。此外，使用`DDC/CI`协议进行通信可能需要适当的驱动程序和软件支持，以确保兼容性和功能可用性。

#### 软件

##### Linux

`xrandr`:

`xrandr --output DisplayPort-0 --brightness 1`

xrandr命令是一个用于配置和控制 X Window System 的工具。通过使用xrandr命令，可以在 Linux 系统中调整显示器的分辨率、刷新率和亮度等参数。

当你运行xrandr --output DisplayPort-0 --brightness 1命令时，它会将指定的显示器（在这里是DisplayPort-0）的亮度设置为1。亮度值的范围通常是0到1之间，其中0表示完全黑暗，1表示最大亮度。

实际上，通过xrandr命令调整显示器亮度是通过修改显示器的背光亮度来实现的。背光亮度是显示器背后的光源的强度，调整它可以改变显示器的亮度。xrandr命令通过与显示驱动程序和硬件交互，将用户指定的亮度值传递给显示器，从而实现亮度的调节。

需要注意的是，这种方式只能在支持背光亮度调节的显示器上起作用。如果显示器不支持背光亮度调节或者使用的显示驱动程序不支持此功能，那么xrandr命令对亮度的调节可能无效。

另外，xrandr命令还可以用于其他显示器设置，如调整分辨率、旋转屏幕方向等。

需要注意的是这个命令能生效但是不会将新的配置写入显示的存储中，去尝试调节显示器的亮度会发现还是原来的值。并且好像是按照当前显示器的亮度等比例调节的。是临时的，早登出当前帐号或重启后恢复原来的。


[ddcutil](https://github.com/rockowitz/ddcutil)

```bash
	sudo add-apt-repository ppa:rockowitz/ddcutil
	sudo apt-get update
	sudo apt install ddcutil
```

ddcutil是一个用于控制和查询显示器设置的命令行工具。它可以与支持 DDC/CI（Display Data Channel/Command Interface）协议的显示器进行通信，并提供了一系列功能来管理和调整显示器的参数。

以下是一些ddcutil命令的常见用途和功能：

查询显示器信息：ddcutil detect命令可以列出系统中连接的显示器，并提供它们的名称、标识符和其他相关信息。

调整亮度和对比度：ddcutil setvcp命令允许你设置显示器的亮度和对比度。例如，ddcutil setvcp 10 50将亮度设置为50%。

调整色彩设置：ddcutil setvcp命令还可以用于调整色彩设置，如色温和色彩饱和度。通过指定不同的VCP（Video Control Parameters），你可以设置不同的色彩属性。

控制输入源切换：对于支持的显示器，ddcutil可以通过setvcp命令切换输入源。例如，ddcutil setvcp 60 3可以切换到第三个输入源。

查询和修改显示器属性：ddcutil getvcp命令可以查询当前显示器的各种属性，如亮度、对比度、分辨率、音量等。ddcutil setvcp命令可以用于修改这些属性的值。

保存和加载显示器配置文件：ddcutil save和ddcutil load命令可以用于保存和加载显示器的配置文件。这样，你可以在需要时快速还原或应用特定的显示器设置。

需要注意的是，ddcutil命令的可用性和功能取决于你的显示器是否支持DDC/CI协议以及操作系统的兼容性。在使用ddcutil之前，你可能需要确保你的显示器已启用DDC/CI功能，并在你的系统上安装了支持的驱动程序和依赖项。

通过命令 sudo ddcutil capabilities 查看输出，如果显示器支持 DDC/CI 协议，将看到显示器的相关信息，包括支持的命令和功能，如果显示器不支持 DDC/CI 或无法访问 DDC/CI 功能，可能会看到相应的错误或没有输出

[ddccontrol/gddccontrol](https://github.com/ddccontrol/ddccontrol):

```bash
sudo apt install ddccontrol gddccontrol ddccontrol-db i2c-tools
```

ddccontrol是一个用于控制支持 DDC/CI（Display Data Channel/Command Interface）协议的显示器的命令行工具。它提供了一种简单的方式来查询和调整显示器的设置。

以下是一些ddccontrol工具的常见用途和功能：

	查询显示器信息：ddccontrol -p命令可以列出系统中连接的显示器，并显示它们的名称、标识符和其他相关信息。

	调整亮度和对比度：ddccontrol -r 0x10 -w <value>命令可以通过修改0x10寄存器的值来调整显示器的亮度。类似地，你可以使用其他寄存器来调整对比度、色彩设置等。

	查询和修改显示器属性：ddccontrol -r <register>命令可以查询指定寄存器的当前值。你可以使用ddccontrol -r <register> -w <value>命令来修改寄存器的值。

	列出显示器支持的控制寄存器：ddccontrol -r命令可以列出显示器支持的所有可控制的寄存器，以及它们的名称和标识符。

	保存和加载显示器配置文件：ddccontrol -s <filename>和ddccontrol -l <filename>命令可以用于保存和加载显示器的配置文件。这样，你可以在需要时快速还原或应用特定的显示器设置。

提供了图形化工具 `gddccontrol` 能更方便的修改

在打开后可能提示当前的显示器不在数据库中，也可以尝试一下，因为有人使用、测试才会入库，比如我的 DELL U2412M
使用过程中可能会出现的问题，在调节的过程中屏幕可能会闪烁，但是能正常调节，windows 上没测试，可能是驱动问题，或者是因为显示器的版本比较老