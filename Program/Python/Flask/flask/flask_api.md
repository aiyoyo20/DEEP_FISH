## url_for

```python
url_for(
    endpoint , 
    * , 
    _anchor = None ,
    _method = None ,
    _scheme = None , 
    _external = None , 
    **values
    )
```

参数说明：

    1. endpoint : 视图函数名称或端点名称。如果只指定视图函数名, url_for 会在同一蓝图内进行自动查找。如果需要跨蓝图,则使用“蓝图名称.视图函数名”的形式。
    
    2. _anchor : 为 URL 添加锚点。
    
    3. _method : 为 URL 设置 HTTP 方法。
    
    4. _scheme : URL 的协议 schemes (http, https, ftp, etc.) 。只在 _external=True 时有效。

    5. _external : 如果设置为 True, 则生成的 URL 将是绝对路径,包含域名和协议部分。默认为 False, 生成相对路径。

    6. **values : 动态参数以关键字参数的形式传入。这些参数会被插入到URL中相应的位置。

例子：

```python
@app.route('/user/<username>')
def profile(username):
    pass

url_for('profile', username='john')
# /user/john/

url_for('profile', username='john', _anchor='details')
# /user/john#details

url_for('profile', username='john', _external=True)
# http://www.example.com/user/john#details

url_for('profile', username='john', _external=True,  _scheme='https')
# https://www.example.com/user/john#details
```

### 注意事项
#### url_for 函数的使用环境
`url_for` 函数的使用需要在 `flask` 应用的上下文中使用，虽然返回值是字符串，但如果在非上下文环境中使用会报错。

**一些可使用的环境介绍**

1. 模板中:
我们可以在Flask模板中使用 `url_for()` 函数来生成URL:

```html
<a href="{{ url_for('user', username='john', _external=True) }}">John's profile</a>
```

这里会生成指向/user/john视图的绝对URL。

2. 视图函数中:
在视图函数中,可以使用url_for()生成指向其他视图的URL:

```python
@app.route('/profile')
def profile():
    url = url_for('user', username=current_user.username)
    return redirect(url)
```

这里会重定向到当前用户的profile页。

3. 交互式环境(Shell)中:
我们可以在Flask shell中使用url_for()来测试URL生成:
```
>>> from yourapp import app
>>> url_for('user', username='john', _external=True)
'http://localhost/user/john'
```

4. 混合环境(CLI)中:
在你的Flask CLI(命令行接口)命令中也可以使用url_for():

```python
@app.cli.command()
def share_profile():
    username = click.prompt('Username')
    url = url_for('user', username=username, _external=True)
    click.echo(f'Here is the link to {username}\'s profile: {url}')
```

#### url_for 函数使用的注意事项
如果没有使用蓝图，使用`url_for("端点名")` 或 `url_for(".端点名")`并没有区别，两个都返回同样的结果。

而如果使用了蓝图，`url_for("端点名")` 会提示错误，并提示你使用`蓝图名.端点名`替换，使用`url_for(".端点名")`是允许的，`.` 和 linux 中相对路径的类似，表示为当前蓝图，也就是一种简写。

而如果是跨蓝图的使用，就必须显式的使用`蓝图名.端点名`，这样在阅读代码的时候也更容易。

同个蓝图中不要出现同名的视图函数，多个蓝图能避免也最好避免。不用考虑说如果有同名的会优先调用哪个，会直接抛出`AssertionError`异常

#### url_for 的参数问题
url_for 函数使用了 `*` 语法糖，除了第一个参数可以使用位置参数，其他的必须使用关键字参数。
