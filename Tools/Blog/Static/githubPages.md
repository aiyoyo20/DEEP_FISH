### 简单介绍使用
以前有个单独配置是需要去选择仓库的属性为 github pages，默认的 框架是 Jekyll，可以选择主题生成预览，现在简单了很多。

1. Github 帐号
2. 创建一个公有仓库：username.github.io
3. 在该仓库的根目录创建一个文件`index.html`,写入简单的 html 语句，去访问 `username.github.io` 能正常显示就说明成功了。
    如果访问没有正常显示，不用太着急，可能不是自己的原因。有时候创建仓库写入文件后去访问网页并不能马上得到预览，存在几分钟的延迟。
4. 使用自己喜欢的、擅长的静态框架按照文档编译，然后找到编译结果输出的目录，将里面所有的文件上传至该仓库就可以了。


还有一些更为高级的选项,可以查看官方文档自行配置：

    通过 GitHub Actions 工作流进行发布
    自定义域名和 GitHub 页面
    使用 HTTPS 保护 GitHub Pages 站点

#### 参考
[github pages doc](https://docs.github.com/zh/pages)

