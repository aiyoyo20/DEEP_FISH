1. 按下windows+R 输入：`shell:startup` 可进入存放启动文件的目录。

这个目录在你的系统中的位置为: `C:\Users\username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

另一个目录： `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup`

都是一样的，这个目录可直接将想要启动的程序的快捷方式放入。

或者新建 `AppName.bat` 或 `.cmd` 的文件，里面写入你想要执行的命令。保存即可。比如想要开机执行一个python、go程序，就可以使用这个方法。