一些有用的网址记录:

[远景论坛](https://bbs.pcbeta.com/):近期回访发现门槛提高了。以前免费看的文章现在需要阅读权限了。
[国光](https://apple.sqlsec.com/):主要为教程
[黑苹果屋](https://imacos.top):工具、软件、驱动等
[黑苹果动力](https://www.mfpud.com/)
[黑苹果乐园](https://mackext.com/)
[黑果小兵的部落阁](https://blog.daliansky.net/)
[xclient](https://xclient.info/)：软件
[黑苹果-工具与相关常用网址整理分享v2.0](https://bbs.pcbeta.com/viewthread-1957443-1-1.html):简直不要太强
[awesome-mac](https://github.com/jaywcjlove/awesome-mac/blob/master/README-zh.md)：软件
[Mac-list](https://github.com/qianguyihao/Mac-list)：软件

## 关闭 SIP 的方法
编辑 `opencore` 的配置文件 `config.plist` 文件,将 `csr-active-config`类型`<Data>`的值改为`67000000`。该方法在 `10.15.7`可用。

开启则是设为原来的 `00000000`