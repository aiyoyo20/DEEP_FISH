### proxy protocol
1. Shadowsocks（SS）
2. ShadowsocksR（SSR）
3. V2Ray
4. VrayX
5. Trojan
6. Trojan-Go

详细的就不累赘了，我了解的也不是很完全，墙内目前也有些介绍，但是只要能翻出去，资料就很多了。这里给出几篇文章，里面有详细介绍，防止失效，自己留了PDF文件。

[科学上网的主流协议大对比！这里面有你在使用的吗？](https://www.techfens.com/posts/kexueshangwang.html)
|
[PDF](./images/科学上网的主流协议大对比.pdf)


[一次搞懂Xray/V2ray/Trojan/Trojan-go/SSR/SS的区别，不再选择困难症
](https://www.lbtlm.com/archives/167)
|
[PDF](./images/d0e0b912-88d6-4066-9cfa-e69dc894c888.pdf)

[SS、SSR、V2ray、Trojan、Xray 这五种翻墙协议与 VPN 对比有何不同？](https://topvpn.wiki/vpn-ssr-v2ray-trojan-xray/)
|
[PDF](./images/057c79d0-6f08-4cab-87b7-2d11483ed21f.pdf)

### 软件
- Qv2ray
    跨平台 V2Ray 客户端，支持 Linux、Windows、macOS，可通过插件系统支持 SSR / Trojan / Trojan-Go / NaiveProxy 等协议
- SagerNet
    SagerNet 是一个基于 V2Ray 的 Android 通用代理应用。
- V2rayN
    V2RayN 是一个基于 V2Ray 内核的 Windows 客户端。
- v2rayA
    基于 web GUI 的跨平台 V2Ray 客户端，在 Linux 上支持全局透明代理，其他平台上支持系统代理。

### 命令行代理

### 浏览器代理
#### Proxy SwitchyOmega
插件商店可搜索下载，目前感觉是使用最舒适的代理切换工具。

情景模式：
可以使用 HTTP/Socks 代理访问网站；可以根据多种条件和规则自动切换；可以根据在线或本地的 PAC 脚本规则使用代理。

规则：
可以在线导入 AutoProxy 和 Switchy 格式的规则，也可以自己添加域名通配符、网址通配符和网址正则等切换规则。可以搭配[GFWList](https://github.com/gfwlist/gfwlist)使用PAC，有奇效，能够自动区分那些需要代理，不用麻烦的切换代理，自己添加规则也很麻烦，网页太多。

快速切换：
可以在浏览器菜单中对情景模式进行快速切换，可以快速对当前网址添加过滤规则。

[官网](https://proxy-switchyomega.com/settings/)

[谷歌插件商店](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif?hl=en)

[github 项目地址](https://github.com/FelisCatus/SwitchyOmega)

### 自用软件代理
#### 路由全局代理
这个比较麻烦，可以买别人刷好系统的路由器，也可以自己刷。还分软路由、硬路由等。

#### 软件有代理接口
有的软件有接口，在设置里面设置一下就可以使用。


#### 系统有全局代理设置

Windows 好像默认全局代理。
Linux 的 KDE、Gnome 有全局代理设置（不绝对）。

#### 手机分享实现全局代理
可以手机使用代理软件，然后通过像 EveryProxy 这类转发软件转发。不过这种方法好像不能全局代理。流量或者wifi（有的设备类似于双网卡，即可以使用wifi也可以热点给别人），数据的流动层不一样，所以不能。不过转发可以实现局域网代理，局域网内的设备通过局域网 IP 端口可共享代理。这样在没有代理配置的设备上也可以使用代理。

### 其他分享

https://zgq-inc.github.io/overthefirewall/

https://github.com/Loyalsoldier/v2ray-rules-dat

https://github.com/gfwlist/gfwlist

