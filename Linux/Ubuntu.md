

## questions
### Failed to load module "xapp-gtk3-module"
Installing xapp installs the missing modules and removes the warning

`sudo apt install xapp`

### 某个命令平时能正常使用，加sudo或者进入root用户显示命令未找到
以node，npm为例，自己下载了包解压到/opt并且在当前用户`.bashrc`文件配置了环境变量，所以能使用，但是在root用户的环境下却是没有的，为其创建软链接到`/usr/local/bin`,或者`/usr/bin`即可,建议前者吧，不用了要删除也方便分辨些

### AppImage文件无法正常启动
通过命令行./启动,发现是缺少相应的库，补全即可
`sudo apt install libfuse2`



