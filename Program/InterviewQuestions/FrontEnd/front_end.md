## 第三章 前端 
### 01 什么是防抖和节流，他们的应用场景有哪些?
在 Issue 中交流与讨论: 01 什么是防抖和节流，他们的应用场景有哪些

#### 防抖 (debounce)
防抖，顾名思义，防止抖动，以免把一次事件误认为多次，敲键盘就是一个每天都会接触到的防抖操作。

想要了解一个概念，必先了解概念所应用的场景。在 JS 这个世界中，有哪些防抖的场景呢?

登录、发短信等按钮避免用户点击太快，以致于发送了多次请求，需要防抖

调整浏览器窗口大小时，resize 次数过于频繁，造成计算过多，此时需要一次到位，就用到了防抖

文本编辑器实时保存，当无任何更改操作一秒后进行保存

代码如下，可以看出来防抖重在清零 clearTimeout(timer)

function debounce (f, wait) {
  let timer
  return (...args) => {
    clearTimeout(timer)
    timer = setTimeout(() => {
      f(...args)
    }, wait)
  }
}

#### 节流 (throttle)
节流，顾名思义，控制水的流量。控制事件发生的频率，如控制为1s发生一次，甚至1分钟发生一次。与服务端(server)及网关(gateway)控制的限流 (Rate Limit) 类似。

scroll 事件，每隔一秒计算一次位置信息等

浏览器播放事件，每隔一秒计算一次进度信息等

input 框实时搜索并发送请求展示下拉列表，每隔一秒发送一次请求 (也可做防抖)

代码如下，可以看出来节流重在加锁 timer=timeout

function throttle (f, wait) {
  let timer
  return (...args) => {
    if (timer) { return }
    timer = setTimeout(() => {
      f(...args)
      timer = null
    }, wait)
  }
}

总结 (简要答案)
防抖：防止抖动，单位时间内事件触发会被重置，避免事件被误伤触发多次。代码实现重在清零clearTimeout。防抖可以比作等电梯，只要有一个人进来，就需要再等一会儿。业务场景有避免登录按钮多次点击的重复提交。
节流：控制流量，单位时间内事件只能触发一次，与服务器端的限流 (Rate Limit) 类似。代码实现重在开锁关锁 timer=timeout; timer=null。节流可以比作过红绿灯，每等一个红灯时间就可以过一次。

### 02 在前端开发中，如何获取浏览器的唯一标识
更多描述: 如何获取浏览器的唯一标识，原理是什么?

在 Issue 中交流与讨论: 02 在前端开发中，如何获取浏览器的唯一标识

由于不同的系统显卡绘制 canvas 时渲染参数、抗锯齿等算法不同，因此绘制成图片数据的 CRC 校验也不一样。

function getCanvasFp () {
  const canvas = document.getElementById('canvas')
  const ctx = canvas.getContext('2d')
  ctx.font = '14px Arial'
  ctx.fillStyle = '#ccc'
  ctx.fillText('hello, shanyue', 2, 2)
  return canvas.toDataURL('image/jpeg')
}
因此根据 canvas 可以获取浏览器指纹信息。

绘制 canvas，获取 base64 的 dataurl

对 dataurl 这个字符串进行 md5 摘要计算，得到指纹信息

但是对于常见的需求就有成熟的解决方案，若在生产环境使用，可以使用以下库

fingerprintjs2
它依据以下信息，获取到浏览器指纹信息，而这些信息，则成为 component

canvas

webgl

UserAgent

AudioContext

对新式 API 的支持程度等

requestIdleCallback(function () {
  Fingerprint2.get((components) => {
    const values = components.map((component) => component.value)
    const fp = Fingerprint2.x64hash128(values.join(''), 31)
  })
})

在 fingerprintjs2 中，对于 component 也有分类

browser independent component：有些 component 同一设备跨浏览器也可以得到相同的值，有些独立浏览器，得到不同的值

stable component: 有些 component 刷新后值就会发生变化，称为不稳定组件

在实际业务中，可根据业务选择合适的组件

const options = {
  excludes: {userAgent: true, language: true}
}
简答
根据 canvas 可以获取浏览器指纹信息

绘制 canvas，获取 base64 的 dataurl

对 dataurl 这个字符串进行 md5 摘要计算，得到指纹信息

若在生产环境使用，可以使用 fingerprintjs2，根据业务需求，如单设备是否可跨浏览器，以此选择合适的 component

### 03 在服务端应用中如何获得客户端 IP
在 Issue 中交流与讨论: 03 在服务端应用中如何获得客户端 IP

如果有 x-forwarded-for 的请求头，则取其中的第一个 IP，否则取建立连接 socket 的 remoteAddr。

而 x-forwarded-for 基本已成为了基于 proxy 的标准HTTP头，格式如下，可见第一个 IP 代表其真实的 IP，可以参考 MDN X-Forwarded-For

X-Forwarded-For: 203.0.113.195, 70.41.3.18, 150.172.238.178
X-Forwarded-For: <client>, <proxy1>, <proxy2>
以下是 koa 获取 IP 的方法

  get ips() {
    const proxy = this.app.proxy;
    const val = this.get(this.app.proxyIpHeader);
    let ips = proxy && val
      ? val.split(/\s*,\s*/)
      : [];
    if (this.app.maxIpsCount > 0) {
      ips = ips.slice(-this.app.maxIpsCount);
    }
    return ips;
  },

  get ip() {
    if (!this[IP]) {
      this[IP] = this.ips[0] || this.socket.remoteAddress || '';
    }
    return this[IP];
  },
参见源码: https://github.com/koajs/koa/…

### 04 js 如何全部替代一个子串为另一个子串
更多描述: 假设有一个字符串 hello. hello. hello. 需要替换为 AAA，即把 hello. 替换为 A

在 Issue 中交流与讨论: 04 js 如何全部替代一个子串为另一个子串

如果需要全量替换字符串，可以使用 String.prototype.replace(re, replacer)，其中正则表达式需要开启 global flag

const s = 'foo foo foo'
s.replce(/foo/g, 'bar')
那如题中，是否可以使用正则表达式来替代子串

答：不可以，因为使用子串构建正则时，有可能有特殊字符，就有可能出现问题，如下

// 期待结果: 'AhelloX hello3 '
> 'hello. helloX hello3 '.replace(new RegExp('hello. ', 'g'), 'A')
< "AAA"
而在 javascript 中替换子串只能使用一种巧妙的办法：str.split(‘foo’).join(‘bar’)

> 'hello. hello. hello. '.split('hello. ').join('A')
< "AAA"
真是一个巧(笨)妙(拙)的办法啊！！！！！大概 TC39 也意识到了一个问题，于是出了一个新的 API，在 ESNext 中

String.prototype.replaceAll()

'aabbcc'.replaceAll('b', '.'); 
// 'aa..cc'
详细文档在 String.prototype.replaceAll

总结(及直接答案)
两种办法

str.split(‘foo’).join(‘bar’)

str.replaceAll(‘foo’, ‘bar’)，在 ESNext 中，目前支持性不好

### 05 如何获取一个进程的内存并监控
更多描述: 在编写脚本时，有时会出现内存过大发生 OOM 的事情，那我们如何得知某个进程的内存？另外又如何监控它

在 Issue 中交流与讨论: 05 如何获取一个进程的内存并监控

通过 ps 可以获知一个进程所占用的内存

$ ps -O rss -p 3506
  PID   RSS S TTY          TIME COMMAND
 3506  6984 S pts/1    00:00:00 vim
如果要监控内存，肯定使用对进程万能的命令 pidstat （PS: 这名字一听就知道是干嘛的）

-r 显示内存信息
-p 指定 pid
1: 每个一秒打印一次
$ pidstat -r -p 3506 1

Linux 3.10.0-957.21.3.el7.x86_64 (shanyue)      11/04/19        _x86_64_        (2 CPU)

20:47:35      UID       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
20:47:36        0      3506      0.00      0.00  139940   6984   0.18  vim
20:47:37        0      3506      0.00      0.00  139940   6984   0.18  vim
20:47:38        0      3506      0.00      0.00  139940   6984   0.18  vim
20:47:39        0      3506      0.00      0.00  139940   6984   0.18  vim
20:47:40        0      3506      0.00      0.00  139940   6984   0.18  vim
20:47:41        0      3506      0.00      0.00  139940   6984   0.18  vim
pidstat 是属于 sysstat 下的 linux 性能工具，但在 mac 中，如何定位内存的变化？此时可以使用万能的 top/htop

$ htop -p 31796
1

总结
简而言之，有以下三个命令

pidstat -r

htop/top -p

ps -O rss -p

关于更多指标的监控可以参考我的文章: linux 各项监控指标小记

### 06 CORS 如果需要指定多个域名怎么办?
在 Issue 中交流与讨论: 06 CORS 如果需要指定多个域名怎么办

CORS 通过控制 Access-Control-Allow-Origin 控制哪些域名可以共享资源，取值如下

Access-Control-Allow-Origin: <origin> | *
其中 * 代表所有域名，origin 代表指定特定域名，那如何设置多个域名了？

此时需要通过代码实现，根据请求头中的 Origin 来设置响应头 Access-Control-Allow-Origin，那 Origin 又是什么东西？

请求头: Origin
并不是所有请求都会自动带上 Origin，在浏览器中带 Origin 的逻辑如下

如果存在跨域，则带上 Origin，值为当前域名

如果不存在跨域，则不带 Origin

逻辑理清楚后，关于服务器中对于 Access-Control-Allow-Origin 设置多域名的逻辑也很清晰了

如果请求头不带有 Origin，证明未跨域，则不作任何处理

如果请求头带有 Origin，证明跨域，根据 Origin 设置相应的 Access-Control-Allow-Origin:<Origin>

使用伪代码实现如下:

// 获取 Origin 请求头
const requestOrigin = ctx.get('Origin');

// 如果没有，则跳过
if (!requestOrigin) {
  return await next();
}

// 设置响应头
ctx.set('Access-Control-Allow-Origin', requestOrigin)
Vary: Origin
此时可以给多个域名控制 CORS，但此时假设有两个域名访问 static.shanyue.tech 的跨域资源

foo.shanyue.tech，响应头中返回 Access-Control-Allow-Origin: foo.shanyue.tech

bar.shanyue.tech，响应头中返回 Access-Control-Allow-Origin: bar.shanyue.tech

看起来一切正常，但如果中间有缓存怎么办？

foo.shanyue.tech，响应头中返回 Access-Control-Allow-Origin: foo.shanyue.tech，被 CDN 缓存

bar.shanyue.tech，因由缓存，响应头中返回 Access-Control-Allow-Origin: foo.shanyue.tech，跨域出现问题

此时，Vary: Origin 就上场了，代表为不同的 Origin 缓存不同的资源

总结 (简要答案)
CORS 如何指定多个域名？

根据请求头中的 Origin 来设置响应头 Access-Control-Allow-Origin，思路如下

总是设置 Vary: Origin，避免 CDN 缓存破坏 CORS 配置

如果请求头不带有 Origin，证明未跨域，则不作任何处理

如果请求头带有 Origin，证明浏览器访问跨域，根据 Origin 设置相应的 Access-Control-Allow-Origin: <Origin>

使用伪代码实现如下

// 获取 Origin 请求头
const requestOrigin = ctx.get('Origin');

ctx.set('Vary', 'Origin')

// 如果没有，则跳过
if (!requestOrigin) {
  return await next();
}

// 设置响应头
ctx.set('Access-Control-Allow-Origin', requestOrigin)
相关问题：如何避免 CDN 为 PC 端缓存移动端页面

### 07 既然 cors 配置可以做跨域控制，那可以防止 CSRF 攻击吗?
在 Issue 中交流与讨论: 07 既然 cors 配置可以做跨域控制，那可以防止 CSRF 攻击吗

对 CORS 一点用也没有

form 提交不通过 CORS 检测，你可以在本地进行测试

即使通过 xhr 及 fetch 进行提交被 CORS 拦住，但是对于简单请求而言，请求仍被发送，已造成了攻击

https://www.toutiao.com/i6855150148276716039/
### 一、HTML
head 内常用标签:  
https://www.cnblogs.com/Dominic-Ji/p/9085037.html  
body 内常用标签:  
https://www.cnblogs.com/Dominic-Ji/p/9085099.html

### 二、CSS
CSS 选择器:  
https://www.cnblogs.com/Dominic-Ji/p/9091130.html  
属性相关:  
https://www.cnblogs.com/Dominic-Ji/p/9100443.html

#### 1. 什么是 CSS 初始化？有什么好处？
> CSS 初始化是指重设浏览器的样式。不同的浏览器默认的样式可能不尽相同，如果没对 CSS 初始化往往会出现浏览器之间的页面差异。
> `好处`：能够统一标签在各大主流浏览器中的默认样式，使得我们开发网页内容时更加方便简洁，同时减少 CSS 代码量，节约网页下载时间。

#### 2. 简述浮动的特征和清除浮动的方法？
> `浮动的特征：`
> 浮动元素有左浮动 (float:left) 和右浮动 (float:right) 两种。
> 浮动的元素会向左或向右浮动，碰到父元素边界、其他元素才停下来。
> 相邻浮动的块元素可以并在一行，超出父级宽度就换行。
> 浮动让行内元素或块元素转化为有浮动特性的行内块元素 (此时不会有行内块元素间隙问题)。
> 父元素如果没有设置尺寸 (一般是高度不设置)，父元素内整体浮动的子元素无法撑开父元素，父元素需要清除浮动。

> `清除浮动的方法：`
> 父级上增加属性 overflow：hidden。
> 在最后一个子元素的后面加一个空的 div，给它样式属性 clear:both。
> 使用成熟的清浮动样式类，clearfix。
```
.clearfix:after,.clearfix:before {content:"";display: table;}
.clearfix:after {clear:both;}
.clearfix {zoom:1;}
```

### 三、JavaScript
#### 1. AJAX 试什么？如何使用 AJAX？
> `ajax`(异步的 javascript 和 xml) 能够刷新局部网页数据而不是重新加载整个网页。

> 第一步，创建 `xmlhttprequest` 对象，`var xmlhttp =new XMLHttpRequest（)`;XMLHttpRequest 对象用来和服务器交换数据。
> 第二步，使用 `xmlhttprequest` 对象的 `open ()` 和 `send ()` 方法发送资源请求给服务器。
> 第三步，使用 `xmlhttprequest` 对象的 `responseText` 或 `responseXML` 属性获得服务器的响应。
> 第四步，`onreadystatechange` 函数，当发送请求到服务器，我们想要服务器响应执行一些功能就需要使用 `onreadystatechange` 函数，每次 `xmlhttprequest` 对象的 `readyState` 发生改变都会触发 `onreadystatechange` 函数。

### 四、jQuery

### 五、Vue.js

### 六、数据结构与算法 (扩充)

#### 知识点梳理
#### 数据结构
> 数据结构决定了数据存储的空间和时间效率问题，数据的写入和提取速度要求也决定了应该选择怎样的数据结构。
> 根据对场景需求的不同，我们设计不同的数据结构，比如：
读得多的数据结构，应该想办法提高数据的读取效率，比如 IP 数据库，只需要写一次，剩下的都是读取；
读写都多的数据结构，要兼顾两者的需求平衡，比如 LRU Cache 算法。
> 算法是数据加工处理的方式，一定的算法会提升数据的处理效率。
> 比如有序数组的二分查找，要比普通的顺序查找快很多，尤其是在处理大量数据的时候。
> 数据结构和算法是程序开发的通用技能，所以在任何面试中都可能会遇见。随着近几年 AI、大数据、小游戏越来越火，Web 前端职位难免会跟数据结构和算法打交道，面试中也会出现越来越多的算法题目。学习数据结构和算法也能够帮助我们打开思路，突破技能瓶颈。

#### 前端常遇⻅的数据结构问题
> 现在我来梳理下前端常遇见的数据结构：
简单数据结构（必须理解掌握）
有序数据结构：栈、队列、链表，有序数据结构省空间（存储空间小）
无序数据结构：集合、字典、散列表，无序数据结构省时间（读取时间快）
复杂数据结构
树、堆
图

> 对于简单数据结构，在 ES 中对应的是数组（Array）和对象（Object）。可以想一下，数组的存储是有序的，对象的存储是无序的，但是我要在对象中根据 key 找到一个值是立即返回的，数组则需要查找的过程。

> 这里我通过一个真实面试题目来说明介绍下数据结构设计。

> `题目：使用 ECMAScript（JS）代码实现一个事件类 Event，包含下面功能：绑定事件、解绑事件和派发事件`。

> 在稍微复杂点的页面中，比如组件化开发的页面，同一个页面由两三个人来开发，为了保证组件的独立性和降低组件间耦合度，我们往往使用「订阅发布模式」，即组件间通信使用事件监听和派发的方式，而不是直接相互调用组件方法，这就是题目要求写的 Event 类。

> 这个题目的核心是一个事件类型对应回调函数的数据设计。为了实现绑定事件，我们需要一个 `_cache 对象` 来记录绑定了哪些事件。而事件发生的时候，我们需要从 `_cache` 中读取出来事件回调，依次执行它们。一般页面中事件派发（读）要比事件绑定（写）多。所以我们设计的数据结构应该尽量地能够在事件发生时，更加快速地找到对应事件的回调函数们，然后执行。

> 经过这样一番考虑，我简单写了下代码实现：

```
class Event {constructor () {
        // 存储事件的数据结构
        // 为了查找迅速，使⽤了对象（字典）
        this._cache = {};}

    // 绑定
    on (type, callback) {
        // 为了按类查找⽅便和节省空间，
        // 将同⼀类型事件放到⼀个数组中
        // 这⾥的数组是队列，遵循先进先出
        // 即先绑定的事件先触发
        let fns = (this._cache [type] = this._cache [type] || []);
        if (fns.indexOf (callback) === -1) {fns.push (callback);
        }
        return this;
    }

    // 触发
    trigger (type, data) {let fns = this._cache [type];
        if (Array.isArray (fns)) {fns.forEach ((fn) => {fn (data);
            });
        }
        return this;
    }

    // 解绑
    off (type, callback) {let fns = this._cache [type];
        if (Array.isArray (fns)) {if (callback) {let index = fns.indexOf (callback);
                if (index !== -1) {fns.splice (index, 1);
                }
            } else {
                // 全部清空
                fns.length = 0;
            }
        }
        return this;
    }
}

// 测试⽤例

const event = new Event ();
event.on ('test', (a) => {console.log (a);
});
event.trigger ('test', 'hello world');
event.off ('test');
event.trigger ('test', 'hello world');
```

> 类似于树、堆、图这些高级数据结构，前端一般也不会考查太多，但是它们的查找方法却常考，后面介绍。高级数据应该平时多积累，好好理解，比如理解了堆是什么样的数据结构，在面试中遇见的「查找最大的 K 个数」这类算法问题，就会迎刃而解。

> 算法的效率是通过算法复杂度来衡量的

> 算法的好坏可以通过算法复杂度来衡量，算法复杂度包括时间复杂度和空间复杂度两个。时间复杂度由于好估算、好评估等特点，是面试中考查的重点。空间复杂度在面试中考查得不多。

#### 常见的时间复杂度有

*   常数阶 O (1)
*   对数阶 O (logN)
*   线性阶 O (n)
*   线性对数阶 O (nlogN)
*   平方阶 O (n^2)
*   立方阶 O (n^3)
*   !k 次方阶 O (n^k)
*   指数阶 O (2^n)

> 随着问题规模 n 的不断增大，上述时间复杂度不断增大，算法的执行效率越低。

> 一般做算法复杂度分析的时候，遵循下面的技巧：

*   > 1. 看看有几重循环，一般来说一重就是 O (n)，两重就是 O (n^2)，以此类推

*   > 2. 如果有二分，则为 O (logN)

*   > 3. 保留最高项，去除常数项

> `题目：分析下面代码的算法复杂度`（为了方便，我已经在注释中加了代码分析）

```
let i = 0; // 语句执⾏⼀次

while (i < n) { 
    // 语句执⾏ n 次
    console.log (`Current i is ${i}`); // 语句执⾏ n 次
    i++;         // 语句执⾏ n 次
}
```> 根据注释可以得到，算法复杂度为 1 + n + n + n = 1 + 3n，去除常数项，为 O (n)。```
let number = 1; // 语句执⾏⼀次

while (number < n) { // 语句执⾏ logN 次
    number *= 2; // 语句执⾏ logN 次
}
```> 上面代码`while`的跳出判断条件是`number<n`，而循环体内 number 增长速度是 (2^n)，所以循环代码实际执行 logN 次，复杂度为：1 + 2 * logN = O (logN)```
for (let i = 0; i < n; i++) {// 语句执⾏ n 次
    for (let j = 0; j < n; j++) {// 语句执⾏ n^2 次
        console.log ('I am here!'); // 语句执⾏ n^2 次
    }
}
```

> 上面代码是两个 for 循环嵌套，很容易得出复杂度为：O (n^2)

#### ⼈⼈都要掌握的基础算法

> 枚举和递归是最最简单的算法，也是复杂算法的基础，人人都应该掌握！枚举相对比较简单，我们重点说下递归。

> 递归由下面两部分组成：

*   > 1. 递归主体，就是要循环解决问题的代码

*   > 2. 递归的跳出条件，递归不能一直递归下去，需要完成一定条件后跳出

> 关于递归有个经典的面试题目是：

> 实现 JS 对象的深拷贝

#### 什么是深拷⻉？

> 「深拷贝」就是在拷贝数据的时候，将数据的所有引用结构都拷贝一份。简单的说就是，在内存中存在两个数据结构完全相同又相互独立的数据，将引用型类型进行复制，而不是只复制其引用关系。

> 分析下怎么做「深拷贝」：

*   > 1. 首先假设深拷贝这个方法已经完成，为 `deepClone`

*   > 2. 要拷贝一个数据，我们肯定要去遍历它的属性，如果这个对象的属性仍是对象，继续使用这个方法，如此往复

```
function deepClone (o1, o2) {for (let k in o2) {if (typeof o2 [k] === 'object') {o1 [k] = {};
            deepClone (o1 [k], o2 [k]);
        } else {o1 [k] = o2 [k];
        }
    }
}

// 测试⽤例
let obj = {
    a: 1,
    b: [1, 2, 3],
    c: {}};
let emptyObj = Object.create (null);
deepClone (emptyObj, obj);
console.log (emptyObj.a == obj.a);
console.log (emptyObj.b == obj.b);
```>` 递归容易造成爆栈 `，尾部调用可以解决递归的这个问题，Chrome 的 V8 引擎做了尾部调用优化，我们在写代码的时候也要注意尾部调用写法。

> 递归的爆栈问题可以通过将递归改写成枚举的方式来解决，就是通过 `for` 或者 `while` 来代替 `递归`。

> 我们在使用递归的时候，要注意做优化，比如下面的题目。

> `题目：求斐波那契数列（兔子数列） 1,1,2,3,5,8,13,21,34,55,89… 中的第 n 项下面的代码中 count 记录递归的次数`，我们看下两种差异性的代码中的 count 的值：

```
let count = 0;

function fn (n) {let cache = {};

    function _fn (n) {if (cache [n]) {return cache [n];
        }
        count++;
        if (n == 1 || n == 2) {return 1;}
        let prev = _fn (n - 1);
        cache [n - 1] = prev;
        let next = _fn (n - 2);
        cache [n - 2] = next;
        return prev + next;
    }

    return _fn (n);
}

let count2 = 0;

function fn2 (n) {
    count2++;
    if (n == 1 || n == 2) {return 1;}
    return fn2 (n - 1) + fn2 (n - 2);
}

console.log (fn (20), count); // 6765 20
console.log (fn2 (20), count2); // 6765 13529
```

#### 快排和⼆分查找

> 前端中面试排序和查找的可能性比较小，因为 JS 引擎已经把这些常用操作优化得很好了，可能项目中你费劲写的一个排序方法，都不如 Array.sort 速度快且代码少。因此，掌握快排和二分查找就可以了。

> 快排和二分查找都基于一种叫做「分治」的算法思想，通过对数据进行分类处理，不断降低数量级，实现 O (logN)（对数级别，比 O (n) 这种线性复杂度更低的一种）的复杂度。

#### 快速排序

> `快排大概的流程是`：

*   > 1. 随机选择数组中的一个数 A，以这个数为基准

*   > 2. 其他数字跟这个数进行比较，比这个数小的放在其左边，大的放到其右边

*   > 3. 经过一次循环之后，A 左边为小于 A 的，右边为大于 A 的

*   > 4. 这时候将左边和右边的数再递归上面的过程

> `具体代码如下`：

```
const Arr = [85, 24, 63, 45, 17, 31, 96, 50];

function quickSort (arr) {if (arr.length <= 1) {return arr;}
    let pivotIndex = Math.floor (arr.length/ 2);
    let pivot = arr.splice (pivotIndex, 1)[0];
    let left = [];
    let right = [];
    for (let i = 0; i < arr.length; i++) {if (arr [i] <pivot) {left.push (arr [i]);
        } else {right.push (arr [i]);
        }
    }
    // 递归
    return quickSort (left).concat ([pivot], quickSort (right));
}

console.log (quickSort (Arr));
```

#### ⼆分查找

> 二分查找法主要是解决「在一堆有序的数中找出指定的数」这类问题，不管这些数是一维数组还是多维数组，只要有序，就可以用二分查找来优化。

> 二分查找是一种「分治」思想的算法，`大概流程` 如下：

*   > 1. 数组中排在中间的数字 A，与要找的数字比较大小

*   > 2. 因为数组是有序的，所以：  
    a) A 较大则说明要查找的数字应该从前半部分查找  
    b) A 较小则说明应该从查找数字的后半部分查找

*   > 3. 这样不断查找缩小数量级（扔掉一半数据），直到找完数组为止

> `题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。`

> 另外笔者在面试中遇见过下面的问题：

> `题目：现在我有一个 1~1000 区间中的正整数，需要你猜下这个数字是几，你只能问一个问题：大了还是小了？问需要猜几次才能猜对？`

> 拿到这个题目，笔者想到的就是电视上面有个「猜价格」的购物节目，在规定时间内猜对价格就可以把实物抱回家。所以问题就是让面试官不停地回答我猜的数字比这个数字大了还是小了。这就是二分查找！

> 猜几次呢？其实这个问题就是个二分查找的算法时间复杂度问题，二分查找的时间复杂度是  
O (logN)，所以求 log1000 的解就是猜的次数。我们知道 2^10=1024，所以可以快速估算出：  
log1000 约等于 10，最多问 10 次就能得到这个数！

#### ⾯试遇⻅不会的算法问题怎么办

> 面试的时候，在遇见算法题目的时候，应该揣摩面试官的意图，听好关键词，比如：有序的数列做查找、要求算法复杂度是 O (logN) 这类一般就是用二分的思想。

> 一般来说算法题目的解题思路分以下四步：

*   > 1. 先降低数量级，拿可以计算出来的情况（数据）来构思解题步骤

*   > 2. 根据解题步骤编写程序，优先将特殊情况做好判断处理，比如一个大数组的问题，如果数组为两个数长度的情况

*   > 3. 检验程序正确性

*   > 4. 是否可以优化（由浅到深），有能力的话可以故意预留优化点，这样可以体现个人技术能力

#### 正则匹配解题

> 很多算法题目利用 ES 语法的特性来回答更加简单，比如正则匹配就是常用的一种方式。笔者简单通过几个真题来汇总下正则的知识点。

> `题目：字符串中第一个出现一次的字符`

> 请实现一个函数用来找出字符流中第一个只出现一次的字符。例如，当从字符流中只读出前两个字符「go」时，第一个只出现一次的字符是「g」。当从该字符流中读出前六个字符「google」时，第一个只出现一次的字符是「l」。

> 这个如果用纯算法来解答需要遍历字符串，统计每个字符出现的次数，然后按照字符串的顺序来找出第一次出现一次的字符，整个过程比较繁琐，如果用正则就简单多了。

```
function find (str) {for (var i = 0; i < str.length; i++) {let char = str [i]
        let reg = new RegExp (char, 'g');
        let l = str.match (reg).length
        if (l === 1) {return char}
    }
}
```

> 当然，使用 indexOf/lastIndexOf 也是一个取巧的方式。再来看一个千分位问题。

> `题目：将 1234567 变成 1,234,567，即千分位标注`

> 这个题目可以用算法直接来解，如果候选人使用正则来回答，这样主动展现了自己其他方面的优势，即使不是算法解答出来的，面试官一般也不会太难为他。这道题目可以利用正则的 `「零宽断言」(?=exp)`，意思是它断言自身出现的位置的后面能匹配表达式 exp。

> 数字千分位的特点是，第一个逗号后面数字的个数是 3 的倍数，正则：`/(\d {3})+$/`；第一个逗号前最多可以有 `1~3` 个数字，正则：`/\d {1,3}/`。加起来就是 `/\d {1,3}(\d {3})+$/`，分隔符要从前往后加。

```
function exchange (num) {
    num += ''; // 转成字符串
    if (num.length <= 3) {return num;}

    num = num.replace (/\\d {1,3}(?=(\\d {3})+$)/g, (v) => {console.log (v)
        return v + ',';
    });
    return num;
}

console.log (exchange (1234567));
```

> 当然上面讲到的多数是算法题目取巧的方式，下面这个题目是纯正则考查，笔者在面试的过程中碰见过，这里顺便提一下。

> `题目，请写出下面的代码执行结果`

```
var str = 'google'; 
var reg = /o/g; 
console.log (reg.test (str)) 
console.log (reg.test (str)) 
console.log (reg.test (str))
```> 代码执行后，会发现，最后一个不是为 true，而是 false，这是因为 reg 这个正则有个 g，即 global 全局的属性，这种情况下`lastIndex`就发挥作用了，可以看下面的代码执行结果就明白了。```
console.log (reg.test (str), reg.lastIndex) 
console.log (reg.test (str), reg.lastIndex) 
console.log (reg.test (str), reg.lastIndex)
```> 实际开发中也会犯这样的错误，比如为了减少变量每次都重新定义，会把用到的变量提前定义好，这样在使用的时候容易掉进坑里，比如下面代码：```
(function () {
    const reg = /o/g;

    function isHasO (str) {
        //reg.lastIndex = 0; 这样就可以避免这种情况
        return reg.test (str)
    }

    var str = 'google';
    console.log (isHasO (str))
    console.log (isHasO (str))
    console.log (isHasO (str))
}())
```

#### ⼩结

> 本小节介绍了数据结构和算法的关系，作为普通的前端也应该学习数据结构和算法知识，并且顺带介绍了下正则匹配。具体来说，本小节梳理了以下几部分数据结构和算法知识点：

*   > 1. 经常用到的数据结构有哪些，它们的特点有哪些

*   > 2. 递归和枚举是最基础的算法，必须牢牢掌握

*   > 3. 排序里面理解并掌握快速排序算法，其他排序算法可以根据个人实际情况大概了解

*   > 4. 有序查找用二分查找

*   > 5. 遇见不会的算法问题，先缩小数量级，然后分析推导

> 当然算法部分还有很多知识，比如动态规划这些算法思想，还有图和树常用到的广度优先搜索和深度优先搜索。这些知识在前端面试和项目中遇见得不多，`感兴趣的同学可以在梳理知识点的时候根据个人情况自行决定是否复习`。

```None.K.Sun 整理 2020-11-09 10:33```

### 七、《京程一灯》精英班考试题 
*   1. 请写出弹出值，并解释为什么。(5 分)
*   2. 请写出如下输出值，并写出把注释掉的代码取消注释的值，并解释为什么？(8 分)
*   3. 请写出如下点击 li 的输出值，并用三种办法正确输出 li 里的数字。(12 分)
*   4. 写出输出值，并解释为什么。(5 分)
*   5. 请在下面写出 JavaScript 面向对象编程的混合式继承。并写出 ES6 版本的继承。（20 分）
*   6. 请用一句话算出 0-100 之间学生的学生等级，如 90-100 输出为 1 等生、80-90 为 2 等生以此类推。不允许使用 if switch 等。（10 分）
*   7. 请你写出如何利用 EcmaScript6/7（小 Demo）优化多步异步嵌套的代码？(15 分)
*   8. 请问点击

    ```<buttion id=“test”></button>```

    会有反应么？为什么？能解决么？（5 分）
*   9. 请用一句话遍历变量 a。(禁止用 for 已知 var a = “abc”)(10 分)
*   10. 请写出如下输出值，并解释为什么。(12 分)
*   【附加题】. 请描述你理解的函数式编程，并书写如下代码结果，最后请问如何具体的将函数式编程应用到你的项目（10 分）
*   题目：类型判断用到哪些方法？

```
以下内容来自 《京程一灯》精英班大前端学习班考试题

申明：内容仅用于个人学习使用，非商业用途.
```##### 1. 请写出弹出值，并解释为什么。(5 分)```
+function () {alert (a);
    a ();
    var a = function () {console.log (1);
    };

    function a () {console.log (2);
    }

    alert (a);
    a ();
    var c = d = a;
}();
alert (d);
alert (c);
```##### 2. 请写出如下输出值，并写出把注释掉的代码取消注释的值，并解释为什么？(8 分)```
this.a = 20;
var test = {
    a: 40,
    init: () => {console.log (this.a);

        function go () {
            //this.a = 60;
            console.log (this.a);
        }

        go.prototype.a = 50;
        return go;
    }
};
//var p = test.init ();
//p ();
new (test.init ())();
```##### 3. 请写出如下点击 li 的输出值，并用三种办法正确输出 li 里的数字。(12 分)```
<ul>
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
</ul>

<script type = "text/javascript">
var list_li = document.getElementsByTagName ("li");
for (var i = 0; i < list_li.length; i++) {list_li [i].onclick = function () {console.log (i);
    }
}
</script>
```##### 4. 写出输出值，并解释为什么。(5 分)```
function test (m) {m = {v: 5}
}

var m = {k: 30};
test (m);
alert (m.v);
```##### 5. 请在下面写出 JavaScript 面向对象编程的混合式继承。并写出 ES6 版本的继承。（20 分）```
要求：

汽车是父类，Cruze 是子类。

父类有颜色、价格属性，有售卖的方法。

Cruze 子类实现父类颜色是红色，价格是 140000, 售卖方法实现输出如下语句：

将 红色的 Cruze 买给了小王价格是 14 万。
```

##### 6. 请用一句话算出 0-100 之间学生的学生等级，如 90-100 输出为 1 等生、80-90 为 2 等生以此类推。不允许使用 if switch 等。（10 分）

##### 7. 请你写出如何利用 EcmaScript6/7（小 Demo）优化多步异步嵌套的代码？(15 分)

##### 8. 请问点击

```<buttion id=“test”></button>```

会有反应么？为什么？能解决么？（5 分）

```
$('#test').click (function (argument) {console.log (1);
});
setTimeout (function () {console.log (2);
}, 0);
while (true) {console.log (3);
}
```

#### 9. 请用一句话遍历变量 a。(禁止用 for 已知 var a = “abc”)(10 分)

#### 10. 请写出如下输出值，并解释为什么。(12 分)

```
var s = [];
var arr = s;
for (var i = 0; i < 3; i++) {
    var pusher = {value: "item" + i}, tmp;
    if (i !== 2) {tmp = []
        pusher.children = tmp
    }
    arr.push (pusher);
    arr = tmp;
}
console.log (s [0]);
```>`10 答案 `

> 这道题可能稍微有点难，考的是 JS 的模拟指针移动问题。

> 本题考点分为如下

> (http://qiniu.cdn.python87.com/ 微信截图_20201109110123.png "null")

* * *

> (http://qiniu.cdn.python87.com/ 微信截图_20201109110133.png "null")

* * *

#### 【附加题】. 请描述你理解的函数式编程，并书写如下代码结果，最后请问如何具体的将函数式编程应用到你的项目（10 分）

```
var Container = function (x) {this.__value = x;}
Container.of = x => new Container (x);
Container.prototype.map = function (f) {return Container.of (f (this.__value))
}
Container.of (3)
    .map (x => x + 1)
    .map (x => 'Result is ' + x);
```>` 附加题答案 `：

> 函数式编程是很复杂的话题但是我教给大家的东西足够了。

> 本题考点分为如下

> 1. 基础函子的概念。首先创建一个基础的容器 Container，当一个容器具有 map 方法的时候她也  
可以叫一个函子。of 是为了解决函数式编程更不像面向对象编程。接下来我们传入了新的 3 ，  
x+1 等，每一次都是一个变形关系。产生一个新的函子，也就是一个新的范畴。函数式编程讲  
的是函数要切忌纯！同时柯里化（curry）？代码组合（compose）？等等你是否还有印象。

> 2. 项目实战。我去掉了一些模块化的判断。

```
(function () {var _ = function (obj) {if (obj instanceof _) return obj;
        if (!(this instanceof _)) return new _(obj);
    };
    _.VERSION = '0';
    _.isNaN = function (obj) {return _.isNumber (obj) && obj !== +obj;
    };
    return _;
}.call (this));
```

* * *

> `写到最后`

> 其实 JS 的基础知识还不止这些，比如 ECMAScript 中定义了 6 种原始类型：Boolean、String、Number、Null、Undefined、Symbol（ES6 新定义）`注意：原始类型不包含 Object`。

##### 题目：类型判断用到哪些方法？

> typeof xxx 得到的值有以下几种类型：undefined boolean number string object function、symbol 。

> 这里需要注意的有三点：

*   > (1) typeof null 结果是 object ，因为 null 也是一种引用类型，不是值类型

*   > (2) typeof [1, 2] 结果是 object，结果中没有 array 这一项，引用类型除了 function 其他的全部都是 object、typeof symbol 用 typeof 获取 symbol 类型的值得到的是 symbol，这是 ES6 新增的知识点

*   > (3) instanceof 用于实例和构造函数的对应。例如判断一个变量是否是数组，使用 typeof 无法判断，但可以使用 [1, 2] instanceof Array 来判断。因为，[1, 2] 是数组，它的构造函数就是 Array。

> 同理

```
function Foo (name) {this.name = name}

var foo = new Foo ('bar');
console.log (foo instanceof Foo);    //true...
```> 最后问下为什么```
Object.prototype.toString.call ([])== "[object Array]";
```

最正确？

### No1: 答案

> 本题考点分为如下：

> 1.IIFE 第一行考点用了一个 + 号 ，其实就是把函数变成函数表达式，直接执行 function () {}(); 会报错。常用的写法是 ( function (){})(), 此时其实创建了闭包。> 2. 变量与函数提升，但此时函数的名字也是 a 变量也是 a, 所以会造成 function a (){}，var a。此时 var a 因为未被定义所以被忽略了。所以顶部的输出值是 2 和 2. 接下来输出是 1 和 1，是因为函数的提升要比变量提升的更前。局面就是 var a,function a (){},a=function (){};alert (a)

> 3. 作用域和连等问题 此时的 var c = d= a。实际是 d = a,var c=d; 所以 c 是 undefined，但是要千  
万注意是不是严格模式下。扩展的题为 var a = {n:1}; var b = a; a.x = a = {n:2};  
alert (a.x);// –> undefined alert (b.x);// –> {n:2}
