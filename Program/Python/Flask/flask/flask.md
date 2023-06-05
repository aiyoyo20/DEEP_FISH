## 配置

flask 提供了配置支持，包括但不限于 flask 本身需要的环境配置，额外的如：消息队列、数据库、自定义的应用等需要的全局变量都可以添加，并与 flask 关联，这样在需要使用配置内容的时候可以不用一次次去导入。

一些参数说明：

`silent` : 这个参数的默认为 False。

作用是：比如 `from_pyfile()` 方法这个值表示如果从传入的路径没有找到相应的文件，不会引发异常，如果需要确定是否正确加载了配置，就需要设置为 `True`

`root_path` : 这个参数是用于给 `from_pyfile()` 等方法指定初始路径。

一般来说配置基本都是在项目目录下的，方便查找和修改，不同服务器部署使用绝对路径会频繁修改也不符合习惯。但如果不在项目目录下，或者希望传入文件名而不是相对路径可以配置这个参数。

配置 `root_path` 的几种方式：

1. `app = Flask(__name__, root_path="...")` 初始化应用时传递, 但这个优先级较低，可能会被覆盖。

2. `app = Flask(__name__, instance_relative_config=True)`, `instance_relative_config`参数默认为 False，当设置为真时会将 `root_path` 替换为传入的 `instance_path`，提供的路径必须是绝对路径，如果没有传入 `instance_path` 的话会自己取查找路径。

3. 使用`app.config.root_path` 配置。这个是直接给最终的配置类赋值，有最高优先级。

在没有相关指定的情况下，通常 `app = Flask(__name__)` 这个代码所在文件的目录就是默认路径。

### 默认配置
```python
{
    "ENV": "production",
    "DEBUG": False,
    "TESTING": False,
    "PROPAGATE_EXCEPTIONS": None,
    "PRESERVE_CONTEXT_ON_EXCEPTION": None,
    "SECRET_KEY": None,
    "PERMANENT_SESSION_LIFETIME": timedelta(days=31),
    "USE_X_SENDFILE": False,
    "SERVER_NAME": None,
    "APPLICATION_ROOT": "/",
    "SESSION_COOKIE_NAME": "session",
    "SESSION_COOKIE_DOMAIN": None,
    "SESSION_COOKIE_PATH": None,
    "SESSION_COOKIE_HTTPONLY": True,
    "SESSION_COOKIE_SECURE": False,
    "SESSION_COOKIE_SAMESITE": None,
    "SESSION_REFRESH_EACH_REQUEST": True,
    "MAX_CONTENT_LENGTH": None,
    "SEND_FILE_MAX_AGE_DEFAULT": None,
    "TRAP_BAD_REQUEST_ERRORS": None,
    "TRAP_HTTP_EXCEPTIONS": False,
    "EXPLAIN_TEMPLATE_LOADING": False,
    "PREFERRED_URL_SCHEME": "http",
    "JSON_AS_ASCII": True,
    "JSON_SORT_KEYS": True,
    "JSONIFY_PRETTYPRINT_REGULAR": False,
    "JSONIFY_MIMETYPE": "application/json",
    "TEMPLATES_AUTO_RELOAD": None,
    "MAX_COOKIE_SIZE": 4093,
}
```

简单介绍：

    ENV

        应用运行于什么环境。 Flask 和 扩展可以根据环境不同而行为不同，如打开或 关闭调试模式。 env 属性映射了这个配置键。本变量由 FLASK_ENV 环境变量设置。如果本变量是在代码中设置的话，可能出 现意外。

        在生产环境中不要使用 development 。

        缺省值： 'production'
        Changelog

    DEBUG

        是否开启调试模式。使用 flask run 启动开发服务器时，遇到未能处理的 异常时会显示一个交互调试器，并且当代码变动后服务器会重启。 debug 属性映射了这个配置键。当 ENV 是 'development' 时，本变量会启用，并且会被 FLASK_DEBUG 环境变量 重载。如果本变量是在代码中设置的话，可能会出现意外。

        在生产环境中不要开启调试模式。

        缺省值：当 ENV 是 'development' 时，为 True ；否则为 False 。

    TESTING

        开启测试模式。异常会被广播而不是被应用的错误处理器处理。扩展可能也会为 了测试方便而改变它们的行为。你应当在自己的调试中开启本变量。

        缺省值： False

    PROPAGATE_EXCEPTIONS

        异常会重新引发而不是被应用的错误处理器处理。在没有设置本变量的情况下， 当 TESTING 或 DEBUG 开启时，本变量隐式地为真。

        缺省值： None

    PRESERVE_CONTEXT_ON_EXCEPTION

        当异常发生时，不要弹出请求情境。在没有设置该变量的情况下，如果 DEBUG 为真，则本变量为真。这样允许调试器错误请求数据。本变量通常不 需要直接设置。

        缺省值： None

    TRAP_HTTP_EXCEPTIONS

        如果没有处理 HTTPException 类型异常的处理器，重新引发该异常用于被 交互调试器处理，而不是作为一个简单的错误响应来返回。

        缺省值： False

    TRAP_BAD_REQUEST_ERRORS

        尝试操作一个请求字典中不存在的键，如 args 和 form ，会返回一个 400 Bad Request error 页面。开启本变量，可以把这种错误作为一个未处理的 异常处理，这样就可以使用交互调试器了。本变量是一个特殊版本的 TRAP_HTTP_EXCEPTIONS 。如果没有设置，本变量会在调试模式下开启。

        缺省值： None

    SECRET_KEY

        密钥用于会话 cookie 的安全签名，并可用于应用或者扩展的其他安全需求。 密钥应当是一个长的随机的 bytes 或者 str 。例如，复制下面的 输出到你的配置中:

        $ python -c 'import secrets; print(secrets.token_hex())'
        '192b9bdd22ab9ed4d12e236c78afcb9a393ec15f71bbf5dc987d54727823bcbf'

        当发贴提问或者提交代码时，不要泄露密钥。

        缺省值： None

    SESSION_COOKIE_NAME

        会话 cookie 的名称。假如已存在同名 cookie ，本变量可改变。

        缺省值： 'session'

    SESSION_COOKIE_DOMAIN

        认可会话 cookie 的域的匹配规则。如果本变量没有设置，那么 cookie 会被 SERVER_NAME 的所有子域认可。如果本变量设置为 False ，那么 cookie 域不会被设置。

        缺省值： None

    SESSION_COOKIE_PATH

        认可会话 cookie 的路径。如果没有设置本变量，那么路径为 APPLICATION_ROOT ，如果 APPLICATION_ROOT 也没有设置，那么会是 / 。

        缺省值： None

    SESSION_COOKIE_HTTPONLY

        为了安全，浏览器不会允许 JavaScript 操作标记为“ HTTP only ”的 cookie 。

        缺省值： True

    SESSION_COOKIE_SECURE

        如果 cookie 标记为“ secure ”，那么浏览器只会使用基于 HTTPS 的请求发 送 cookie 。应用必须使用 HTTPS 服务来启用本变量。

        缺省值： False

    SESSION_COOKIE_SAMESITE

        限制来自外部站点的请求如何发送 cookie 。可以被设置为 'Lax' （推荐） 或者 'Strict' 。参见 Set-Cookie 选项.

        缺省值： None
        Changelog

    PERMANENT_SESSION_LIFETIME

        如果 session.permanent 为真， cookie 的有效期为本变量设置的数字， 单位为秒。本变量可能是一个 datetime.timedelta 或者一个 int 。

        Flask 的缺省 cookie 机制会验证电子签章不老于这个变量的值。

        缺省值： timedelta(days=31) （ 2678400 秒）

    SESSION_REFRESH_EACH_REQUEST

        当 session.permanent 为真时，控制是否每个响应都发送 cookie 。每次 都发送 cookie （缺省情况）可以有效地防止会话过期，但是会使用更多的带宽。 会持续会话不受影响。

        缺省值： True

    USE_X_SENDFILE

        当使用 Flask 提供文件服务时，设置 X-Sendfile 头部。有些网络服务器， 如 Apache ，识别这种头部，以利于更有效地提供数据服务。本变量只有使用这 种服务器时才有效。

        缺省值： False

    SEND_FILE_MAX_AGE_DEFAULT

        当提供文件服务时，设置缓存控制最长存活期，以秒为单位。可以是一个 datetime.timedelta 或者一个 int 。在一个应用或者蓝图上 使用 get_send_file_max_age() 可以基于单个文件重载 本变量。

        如果设置为 None ，那么 send_file 会告诉浏览器使用条件请求 代替一个计时缓存，这样做比较推荐。

        缺省值： None

    SERVER_NAME

        通知应用其所绑定的主机和端口。子域路由匹配需要本变量。

        如果配置了本变量， SESSION_COOKIE_DOMAIN 没有配置，那么本变量 会被用于会话 cookie 的域。现代网络浏览器不会允许为没有点的域设置 cookie 。为了使用一个本地域，可以在你的 host 文件中为应用路由添加 任意名称。:

        127.0.0.1 localhost.dev

        如果这样配置了， url_for 可以为应用生成一个单独的外部 URL ，而不是 一个请求情境。

        缺省值： None

    APPLICATION_ROOT

        通知应用应用的根路径是什么。这个变量用于生成请求环境之外的 URL （请求 内的会根据 SCRIPT_NAME 生成；参见 应用调度 ）。

        如果 SESSION_COOKIE_PATH 没有配置，那么本变量会用于会话 cookie 路 径。

        缺省值： '/'

    PREFERRED_URL_SCHEME

        当不在请求情境内时使用些预案生成外部 URL 。

        缺省值： 'http'

    MAX_CONTENT_LENGTH

        在进来的请求数据中读取的最大字节数。如果本变量没有配置，并且请求没有指 定 CONTENT_LENGTH ，那么为了安全原因，不会读任何数据。

        缺省值： None

    JSON_AS_ASCII

        把对象序列化为 ASCII-encoded JSON 。如果禁用，那么 jsonify 返回 的 JSON 会包含 Unicode 字符。这样的话，在把 JSON 渲染到 JavaScript 时会有安全隐患。因此，通常应当开启这个变量。

        缺省值： True

    JSON_SORT_KEYS

        按字母排序 JSON 对象的键。这对于缓存是有用的，因为不管 Python 的哈希种 子是什么都能够保证数据以相同的方式序列化。为了以缓存为代价的性能提高可 以禁用它，虽然不推荐这样做。

        缺省值： True

    JSONIFY_PRETTYPRINT_REGULAR

        jsonify 响应会输出新行、空格和缩进以便于阅读。在调试模式下总是启用 的。

        缺省值： False

    JSONIFY_MIMETYPE

        jsonify 响应的媒体类型。

        缺省值： 'application/json'

    TEMPLATES_AUTO_RELOAD

        当模板改变时重载它们。如果没有配置，在调试模式下会启用。

        缺省值： None

    EXPLAIN_TEMPLATE_LOADING

        记录模板文件如何载入的调试信息。使用本变量有助于查找为什么模板没有载入 或者载入了错误的模板的原因。

        缺省值： False

    MAX_COOKIE_SIZE

        当 cookie 头部大于本变量配置的字节数时发出警告。缺省值为 4093 。 更大的 cookie 会被浏览器悄悄地忽略。本变量设置为 0 时关闭警告。

### 添加配置的方式
`config` 实质上是一个字典的子类，可以像字典一样操作，字典的 `get()` `copy()` `clear()` `keys()` `values()` `items()` `pop()` `popitem()` `update()` 等方法都可用

这些配置内容通常都是很重要的，建议全部大写，很多添加的方法会过滤掉小写的内容。

#### 直接设置键值对:

`app.config['SECRET_KEY'] = 'mysecretkey'` 像字典一样添加单个内容，这个方法可以添加小写名的内容。

```python
app.config.update(
    {"PATH_URL": "/root"},
    TESTING=True,
    SECRET_KEY='192b9bdd22ab9ed4d12e236c78afcb9a393ec15f71bbf5dc987d54727823bcbf'
)
```

使用字典的 `update()` 方法添加多个内容，但由于是字典的方法，所以不会判断配置名是不是全大写，如果实在是需要添加小写的也可以使用这个方法。

`from_mapping(mapping: t.Optional[t.Mapping[str, t.Any]] = None, **kwargs: t.Any)` 这个方法的参数和 `update()` 一样，不同的是会过滤掉小写的内容。

#### 从文件导入
1. `from_pyfile(filename: str, silent: bool = False)` 从 `py` 文件加载配置:
`filename`: 文件名，

```python
app.config.from_pyfile('config.py')
```

这个方法最后调用了 `from_object()`,所以配置的变量名需要全大写，配置名小写的内容会被过滤掉。

2. `from_file(filename: str,load: t.Callable[[t.IO[t.Any]], t.Mapping],silent: bool = False)` 加载配置：

这个方法传入文件名和一个调用方法名，这个方法用于解析该格式的文件，`json toml yaml ini` 等格式都可以，需要注意的是，如果解析该文件需要其他的库需要提前安装并导入，并且传入的是函数名，即 `func` 而不是 `func()`

并且这个方法最后调用了 `from_mapping()` 会过滤小写的内容。

```python
import json
app.config.from_file('config.json', json.loads)
```

3. `from_json(self, filename: str, silent: bool = False)` 从 JSON 文件加载配置:

该方法最后返回调用 `from_file(filename, json.load, silent=silent)` ，是一个封装的工具，所以会过滤小写的内容。并且功能重合了，文档警告会在未来使用 `from_file()` 替换

```python
app.config.from_json('config.json')
```

4. `from_envvar()` 从环境变量加载配置文件名:

`config.from_envvar()` 方法是从环境变量中加载配置的。

语法格式是:

```python
app.config.from_envvar('CONFIG_FILE')
```

它会搜索名为 `CONFIG_FILE` 的环境变量, 并期望这个环境变量指向一个配置文件。Flask 会加载这个配置文件来配置应用。

例如, 如果我们设置了环境变量 `CONFIG_FILE=config.py`, 然后:

```python
app.config.from_envvar('CONFIG_FILE')
```

Flask 会加载 `config.py` 这个配置文件来配置应用。这相当于:

```python 
app.config.from_pyfile(os.environ['CONFIG_FILE'])
```

使用 from_envvar() 方法的好处是, 我们不需要知道具体的配置文件的名字是什么,从而可以灵活地控制配置文件。

举个例子:

    在开发环境下,我们设置: `export CONFIG_FILE=config_dev.py`

    然后在生产环境下,我们设置: `export CONFIG_FILE=config_prod.py`

应用代码不变,但是通过不同的环境变量,我们加载了不同的配置文件,达到了动态配置的效果。

准确来说这个只是 `from_pyfile()` 的一个封装，只是从环境中获取文件名或路径。而由于 `from_pyfile()` 方法并不会强制校验文件的后缀名，所以即使不是 `.py` 的文件也可以，只要内容是全大写的键值对形式即可。

#### 从对象引入
`from_object()` 方法用于:

    - 从 Python 对象(而非文件)直接加载配置
    - 该对象可以是类、函数、包或其他包含属性的对象
    - 需要返回一个映射(如字典)或包含属性的对象,这些属性作为配置加载
    - 可以利用 Python 灵活语法实现复杂的配置
    - 易于测试, 可以传入 Mock 对象测试

```python
from config import Config

app = Flask(__name__)
app.config.from_object(Config)
```

我们定义一个 Config 类,其属性就是配置项:

```python
class Config(object):
    DEBUG = True
    SECRET_KEY = 'some key'
```

 然后传入这个 Config 对象给 from_object() 方法,Flask 就会从这个对象加载配置。为了防止配置项冲突,一般使用全大写的变量名定义配置。除了从一个类中加载,也可以从其他对象如:- 一个包
- 一个函数
- 任何包含属性的对象例如从一个包:

```python
app.config.from_object('config.default')
```

该包下的 __init__.py 文件中的属性就作为配置加载。从一个函数:

```python
def default_config():
    return {
        'DEBUG': True,
        'SECRET_KEY': 'some key'
    }

app.config.from_object(default_config)
```

该函数的返回值必须是一个映射(如字典)或对象,其属性/键值对作为配置。

使用该方法的优点：

    1. 配置信息与代码高度结合,不依赖文件
    2. 可以利用 Python 的语法,实现更加复杂的配置逻辑
    3. 方便测试,可以传入 Mock 对象进行测试

#### 从环境导入
`from_prefixed_env(prefix: str = "FLASK", *, loads: t.Callable[[str], t.Any] = json.loads)`
这个方法默认会提取前缀为 `FLASK_` 的环境变量并过滤前缀将其添加到配置类里。前缀可以通过 `from_prefixed_env()` 的 `prefix` 参数来变更。

变量在解析的时候会优先转换为更特殊的数据类型，如果无法转换为其他类型， 那么最后会转换为字符串类型。变量解析缺省使用 `json.loads()` ，因此 可以使用任何合法的 JSON 值，包括列表和字典。解析的行为是可以自定义的， 通过 `from_prefixed_env()` 的 `loads` 参数可以自定义解析的行为。

这个方法默认不会加载。

`FLASK_ENV` `FLASK_DEBUG` 比较特殊，这两个值不用该方法加载也会自动获取。

`FLASK_ENV`： 环境变量控制，把 FLASK_ENV 设置为 development 可以打开调试模式。 

在调试模式下， `flask run` 会缺省使用交互调试器和重载器。如果需要脱离 环境，单独控制调试模式，请使用 FLASK_DEBUG 。

缺省值： production

`FLASK_DEBUG`：是否开启调试模式。

使用 `flask run `启动开发服务器时，遇到未能处理的 异常时会显示一个交互调试器，并且当代码变动后服务器会重启。 debug 属性映射了这个配置键。当 ENV 是 'development' 时，本变量会启用，并且会被 FLASK_DEBUG 环境变量重载。
    
缺省值：当 ENV 是 'development' 时，为 True ；否则为 False 。

配置环境变量提供了简单的方法，使用默认的文件`.env` 或 `.flaskenv`,在文件中写入环境变量的键和值， 在应用启动的时候会自动将这些内容写入环境中。

无论是`run()` 方法，`config` 的任何方法，初始化应用的 Flask 类都没有提供传入额外自定义的环境变量文件名，但是可以使用第三方的库如 `python-dotenv` 进行加载，也可以调用 flask 的 `flask.cli.load_dotenv(path=None)` 方法用于加载。

#### 其他方法：

`get_namespace()` 方法默认会根据传入的前缀过滤出符合要求的配置，并且过滤掉 key 前缀然后转为小写，最后以一个字典的形式返回。

## 路由
用于根据用户访问的 URL 映射对应的处理方法。

### 路由的绑定方式
在不使用插件的情况下有以下几种方式去绑定 `URL` 和 `视图函数`：

    add_url_rule(
        rule: str,
        endpoint: t.Optional[str] = None,
        view_func: t.Optional[t.Callable] = None,
        provide_automatic_options: t.Optional[bool] = None,
        **options: t.Any,
    )

        route(rule: str, **options: t.Any)

            _method_route(self, method: str, rule: str, options: dict)

                get(self, rule: str, **options: t.Any)

                post(self, rule: str, **options: t.Any)

                put(self, rule: str, **options: t.Any)

                delete(self, rule: str, **options: t.Any)

                patch(self, rule: str, **options: t.Any)

方法按缩进来看，越往下的是对上级的封装。通常使用的方法是 `add_url_rule` 和 `route()`。`route()`方法只讨论装饰器的方式被，不讨论 `app.route('/hello')(hello)` 这种比较别扭的方式。其他的方法不便于统一管理，就不详细介绍了。

`route()` 语法简洁,自动提取大多数参数，视图函数名称直接关联到路由规则,便于理解，装饰器形式,与函数定义处近，视觉上是强绑定在一起，在构造和修改代码的时候更方便。但是只能在定义时指定路由规则，不能动态添加。

`add_url_rule` 可以在运行时动态添加路由规则， 规则更加灵活,可以指定 endpoint 名称等。但是语法较繁琐,需要指定更多参数，视图函数名称不直接关联到路由规则。

个人感觉如果是项目初期，路由规则，视图函数需要频繁测试，会有一些临时的视图等等，使用 `route()` 方法更方便。项目中后期，路由规则，视图函数基本定型了，大多根据需要修改视图函数中的业务逻辑，使用 `add_url_rule` 可以实现统一管理。

### route() 方法的使用
#### 1. 简单使用
```python
@app.route('/hello')
def hello():
    return "hello"
```

#### 2. 使用变量名构建动态路由
```python
@app.route('/hello/<username>')
def hello(username):
    return f"hello {username}"
```

并不仅仅是作用一个部分路径的完整名，作为一个路径的部分名也是可以的，比如
```python
@app.route('/hello<username>')
def hello(username):
    return f"hello {username}"
```

#### 3. 使用多个变量名
一个路由中是可以使用多个变量的
```python
@app.route('/hello/<username>/<userid>')
def hello(username, userid):
    return f"hello {username} {userid}"
```

#### 4. 为变量指定默认值 {#变量指定默认值}
```python
@app.route('/user', defaults={'name': 'default_name'})
@app.route('/user/<name>')
def hello_user(name):
    return 'Hello {}!'.format(name)
```

上面是一个使用的例子，其代码实现可以理解为`defaults` 的值会传入函数内部，并构建成函数变量，所以如果是下例的写法，会覆盖传入的变量。

```python
@app.route('/user/<name>', defaults={'name': 'default_name'})
def hello_user(name):
    return 'Hello {}!'.format(name)
```

这个例子不能通过 `/user` `/user/` 访问，访问 `/user/test_name` 最后返回的是`Hello default_name`，无论传入什么变量都返回这个内容

#### 5. 使用转换器定义变量规则: {#anchor1}
flask 自带了以下几种规则对变量的类型进行判断，没有指定的是使用了缺省值 `default` ，因为与 `string` 类底层使用的同一个类，所以可以认为缺省值是 `string`

|规则类型 |说明| 
|--- | ---| 
|string |（缺省值）接受任何不包含斜杠的文本 |
|int    |接受正整数 |
|float  |接受正浮点数 |
|path   |类似 string ，但可以包含斜杠 |
|any    |匹配提供的项目之一 |
|uuid   |接受 UUID 字符串 |

##### string 类型
string 类型支持三个参数：

    minlength ： 最小长度
    maxlength ： 最大长度
    length    ： 指定长度

```python
@app.route('/hello/<string(minlength=5):username>')
def hello(username):
    return f"hello {username}"
```

```python
@app.route('/hello/<string(minlength=5,maxlength=10):username>')
def hello(username):
    return f"hello {username}"
```

```python
@app.route('/hello/<string(length=5):username>')
def hello(username):
    return f"hello {username}"
```

##### int 类型
int 类型提供了几个参数来控制匹配的整数:

    fixed_digits : 匹配确定位数的整数
    min          ：最小值
    max          ：最大值
    signed       : 控制是否允许负数,布尔值，默认为不允许

```python
@app.route('/hello/<int(fixed_digits=5):number>')
def hello(number):
    return f"hello {number}"
```

```python
@app.route('/hello/<int(min=2,max=6000):number>')
def hello(number):
    return f"hello {number}"
```

```python
@app.route('/hello/<int(signed=True):number>')
def hello(number):
    return f"hello {number}"
```

##### float 类型
float 类型使用的参数和 int 类型是一样的

##### uuid 类型
`UUID(Universally Unique IDentifier)` 是一种基于标准 RFC 4122 的通用唯一标识符。它由一个 32 个字符的数字字符串组成,通常写成 `8-4-4-4-12` 的格式，每个位置可使用 `[A-Fa-f0-9]` 中的任意字符。

例如 : `9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb6d`

UUID 的主要用途是:

1. 不需要中心控制或者协调就可以生成全局唯一的 ID。UUID 的生成算法确保每个 UUID 都是唯一的,不同的系统之间生成的 UUID 也不会重复。

2. 由于 UUID 的全局唯一性,它很适合在分布式系统中作为primary key使用。

3. UUID 由数字和字母组成,容易生成和处理,也适合人工记录和输入。

4. UUID 的唯一性不依赖网络,所以即使两个系统完全隔离,它们生成的 UUID 也不会重复。

##### path 类型
和字符串类型相似，但没有参数，且字符中允许 `/` 存在。

##### any 类型
测试 any 不支持正则表达式，仅用于匹配简单的字符串参数。可以传入多个位置参数，不接受关键字参数，重复的会被自动过滤。

可以实现一个路由中可匹配多个路径

```python
@app.route('/<any(bolg,comment,user):data_type>/<header>')
def detail(data_type,header):
    if data_type == "blog":
        return f"blog {header}"
    else:
        return f"{header}"
```

这个例子中的 `bolg,comment,user` 并不是指变量，而是字符串，这个视图函数支持`/bolg` `/comment` `user`三形式的请求，相比分路由分视图或者多重路由的方式简单了很多。

#### 6. 使用多个转换器:
暂时没有简单的方法，但以下两种方式是可用的

使用多重路由：
```python 
@app.route('/hello/<int:number>')
@app.route('/hello/<float:number>')
def hello(number):
    return f"number {number}"
```

使用不同的视图函数：
```python 
@app.route('/hello/<int:number>')
def number_int(number):
    return f"int number {number}"

@app.route('/hello/<float:number>')
def number_float(number):
    return f"float number {number}"
```

#### 7. 自定义规则转换器 {#自定义规则转换器}
要自定义一个转换器, 需要继承 `werkzeug.routing.BaseConverter` 类并重写一些方法和属性。然后在 Flask 应用上注册这个转换器。

注意事项：
    要使用自定义转换器，需要在使用前注册，特别是在蓝图中使用，需要在注册蓝图之前注册转换器。
    在应用中注册的转换器，可以在任何蓝图使用。

`BaseConverter` 基类代码一览 ：代码版本为 (`Werkzeug=2.2.3`) ，以前的 `part_isolating = True`，新版本增加了 `__init_subclass__()` 方法，`part_isolating`的值会根据 `regex` 的值判断并更改预设值。

```python
class BaseConverter:
    """Base class for all converters.

    .. versionchanged:: 2.3
        ``part_isolating`` defaults to ``False`` if ``regex`` contains a ``/``.
    """

    regex = "[^/]+"
    weight = 100
    part_isolating = True

    def __init_subclass__(cls, **kwargs: t.Any) -> None:
        super().__init_subclass__(**kwargs)

        # If the converter isn't inheriting its regex, disable part_isolating by default
        # if the regex contains a / character.
        if "regex" in cls.__dict__ and "part_isolating" not in cls.__dict__:
            cls.part_isolating = "/" not in cls.regex

    def __init__(self, map: Map, *args: t.Any, **kwargs: t.Any) -> None:
        self.map = map

    def to_python(self, value: str) -> t.Any:
        return value

    def to_url(self, value: t.Any) -> str:
        if isinstance(value, (bytes, bytearray)):
            warnings.warn(
                "Passing bytes as a URL value is deprecated and will not be supported"
                " in Werkzeug 2.4.",
                DeprecationWarning,
                stacklevel=7,
            )
            return quote(value, safe="!$&'()*+,/:;=@")

        # safe = https://url.spec.whatwg.org/#url-path-segment-string
        return quote(str(value), encoding=self.map.charset, safe="!$&'()*+,/:;=@")
```

 `regex`： 指定该参数并注册了，就实现了路由的规则限定，只有符合要求的请求才能调用视图。

```python
from werkzeug.routing import BaseConverter

class TelConverter(BaseConverter):
    regex = r"1[85734]\d{9}"
app.url_map.converters['te1'] = TelConverter

@app.route('/telephone/<te1:my_tel>/')
def my_tel(my_tel):
    return "手机号:%s" % my_tel
```

这个例子实现一个电话格式的转换器，只有符合这个规则的请求才会被处理。

 `weight` : 转换器的权重。当多个转换器匹配同一个 URL 时,具有更高权重的转换器将被使用。

```python
from werkzeug.routing import BaseConverter
class TelConverter(BaseConverter):
    regex = r"1[85734]\d{9}"
    weight = 10
class NumberConverter(BaseConverter):
    regex = r"1[85734]\d{9}"
    weight = 50
app.url_map.converters['tel'] = TelConverter
app.url_map.converters['num'] = NumberConverter

@app.route('/test/<tel:my_tel>/')
def tele(my_tel):
    return "手机号:%s" % my_tel
@app.route('/test/<num:my_tel>/')
def numb(my_tel):
    return "number:%s" % my_tel
```

上面的例子请求 `test/18999999999/` 返回 `手机号:18999999999` ，将两个类的 weight 值互换则返回  `number:18999999999`，更小的值优先级越高。

`part_isolating` : 参数的作用是决定 URL 中的参数是否可以包含 `/`。缺省值 `part_isolating=True`, 表示 URL 中的这个参数不能包含斜杠。

这个参数与 `regex` 参数存在一定关联，因为如果要判断是否可以包含 `/` 的前提是可以匹配到 `/`，如果正则表达式明确表示不匹配包含有 `/` 的内容，那么设置这个参数则没有意义。

```
class TestConverter(BaseConverter):
    regex = ".*"
    part_isolating = False

app.url_map.converters['test'] = TestConverter

@app.route('/hello/<test:username>')
def hello(username):
    return f"hello {username}"
```

这个例子当访问 `hello/blo/test` 的时候能够正常访问 并返回 `hello blo/test`，其实如果去查看 path 类型的源码，其实现就是依靠指定 `part_isolating = False` 实现的。

在新的版本中，如果正则中有 `/` 符号，会自己将`part_isolating`  的缺省值 `True` 改为 `False`

```
class TestConverter(BaseConverter):
    regex = "[a-z]{3,}/[a-z]{3,}"

app.url_map.converters['test'] = TestConverter

@app.route('/hello/<test:username>')
def hello(username):
    return f"hello {username}"
```

这样当访问 `hello/blo/test` 的时候能够正常访问 并返回 `hello blo/test`

`to_python` 会自动对 URL 中匹配到的部分做预处理

例如,这里是一个自定义的 ListConverter:

```python
from werkzeug.routing import BaseConverter

class ListConverter(BaseConverter):
    def __init__(self, url_map, separator=':'):
        super().__init__(url_map)
        self.separator = separator

    def to_python(self, value):
        return value.split(self.separator)

app.url_map.converters['list'] = ListConverter

@app.route('/list/<list:values>')
def index(values):
    print(values)
    return values
```

这个例子可以在 URL 和视图函数之间转换列表数据。请求`/list/1:2:3 ` 会输出 `[1, 2, 3]`。

`to_url` 是当使用 `url_for` 方法为这个视图构建 url 的时候做的处理。

```python
from werkzeug.routing import BaseConverter

class ListConverter(BaseConverter):
    def __init__(self, url_map, separator=':'):
        super().__init__(url_map)
        self.separator = separator

    def to_python(self, value):
        return value.split(self.separator)

    def to_url(self,values):
        return ":".join(values)

app.url_map.converters['list'] = ListConverter

@app.route('/list/<list:values>')
def index(values):
    print(values)
    return values

@app.route('/test')
def test():
    url = url_for(".index", values=["a", "b"])
    print(url)
    return url
```
当请求 `/test`  返回 `/list/a:b`

##### 补充
补充个例子:

```python
class RegexConverter(BaseConverter):

    # map接收路径, regex接收正则
    def __init__(self, map, regex):
        super(RegexConverter, self).__init__(map)
        self.regex = regex

app.url_map.converters['regex'] = RegexConverter
@app.route('/index/<regex("\d+"):nid>')
def index(nid):
    # 需要提供自己解析的nid
    print(url_for('index', nid=nid))  # /index/123
    return 'Index'
```

因为只设定了一个参数，所以可以不使用关键字参数，当然能使用关键字参数`regex=`更好。因为括号里面的内容会被解析为参数，设置类实例属性和类属性同名，实例化后查找到的优先是实例属性，所以会被传入的参数取代。

#### 端点名 {#端点名}

端点名称(endpoint) 是在 Flask 中定义视图函数时可以选择的一个名称，如果没有指定，会使用函数名作为默认值。

使用 `endpoint` 参数指定该路由的端点名，`route` 方法并没有显式需要 `endpoint` 参数，但是可以接收关键字参数并传递给下一级处理，也就是 `add_url_rule` 方法。

端点名其实是一个路由的别名，端点名(endpoint) 应该是唯一的，因为它用于将路由规则绑定到视图函数，并且在应用程序中可能会有多个路由规则与同一个视图函数绑定。如果端点名相同，Flask 将无法区分这些路由规则，并且可能会导致错误的路由匹配和行为。

最简单的例子便是在使用 `url_for()` 方法构建 url 时接收的参数实际是端点名，如果有相同的，最后可能得到的不是想要的结果。

使用 `route()` 方法作为装饰器，端点名不允许相同，没指定就是不允许有同名视图函数，如果有相同的，程序不能正常启动。而使用 `add_url_rule()` 犯法添加的路由在端点名重复的情况下程序不会引发异常。

```python
@app.route('/hello',endpoint="hi")
def hello():
    return "hello"

@app.route('/test',endpoint="test")
def hello():
    return url_for("hi")
```

如果不指定 endpoint,该路由的 `端点名` 默认为 `视图函数名`。所以：

```python
@app.route('/hello/')
def hello(username):
    return f"hello {username}"

@app.route('/test/')
def hello(username):
    return f"hello {username}"
```

这样是不可行的

而这样可行：

```python
@app.route('/hello/')
def hello(username):
    return f"hello {username}"

@app.route('/test/',endpoint="test")
def hello(username):
    return f"hello {username}"
```

```python
def hello(number):
    return f"number {number}"

app.add_url_rule('/hello/<int:number>', endpoint="hi", view_func=hello)
```

它有以下好处:

1. 更简短,更有意义 - 相比于 URL 路径
2. 如果视图函数名更改, 端点名不受影响
3. 可以更灵活的生成 URL, 尤其是在重定向或表单提交时

#### 指定请求方法
设置请求方法比较简单，通过关键字参数 `methods=['POST']`传递响应的方式即可。可以指定多个请求方式，在视图中根据请求的不同返回相应的内容。

```python
@app.route('/hello', methods=['POST'])
def hello():
    return "hello"
```

```python
@app.route('/hello', methods=['GET','POST'])
def hello():
    if request.method == 'GET':
        # GET 请求逻辑
    elif request.method == 'POST':
        # POST 请求逻辑
```

#### 其他参数
`redirect_to` 跳转至其他链接，可传递其他完整的url 或该视图文件内的链接

`strict_slashes=True/False` 设置路由路径匹配是否为严格模式，默认不设置为严格路由匹配模式

### add_url_rule() 方法的使用

#### 1. 简单使用
```python
def hello():
    return "hello"

app.add_url_rule('/hello', view_func=hello)
```

#### 2. 使用变量名构建动态路由

```python
def hello(username):
    return f"hello {username}"

app.add_url_rule('/hello/<username>', view_func=hello)
```

```python
def hello(username):
    return f"hello {username}"

app.add_url_rule('/hello<username>', view_func=hello)
```

#### 3. 使用多个变量名
```python
def hello(username, userid):
    return f"hello {username} {userid}"

app.add_url_rule('/hello/<username>/<userid>', view_func=hello)
```

#### 4. 为变量指定默认值
[变量指定默认值](#变量指定默认值)

#### 5. 使用转换器定义变量规则:
使用细节 [route 使用转换器定义变量规则](#anchor1) 方法说明部分有详细的介绍，这里的相同就重复了，给一些例子。

```python
def hello(username):
    return f"hello {username}"

app.add_url_rule('/hello/<string(minlength=5,maxlength=10):username>', view_func=hello)
```

```python
def hello(number):
    return f"hello {number}"

app.add_url_rule('/hello/<int(min=2,max=6000):number>', view_func=hello)
```

```python
def detail(data_type,header):
    if data_type == "blog":
        return f"blog {header}"
    else:
        return f"{header}"

app.add_url_rule('/<any(bolg,comment,user):data_type>/<header>', view_func=hello)
```

#### 6. 使用多个转换器:

```python
def hello(number):
    return f"number {number}"

app.add_url_rule('/hello/<int:number>', view_func=hello, endpoint="hello_int")
app.add_url_rule('/hello/<float:number>', view_func=hello,endpoint="hello_float")
```

例子中为每个路由添加了单独的端点名，实际不添加也能正常运行，`route` 方法可以使用多重路由的方法为同一个视图函数加载多个路由规则，实际也就一个组的路由可以对应一个视图函数，而使用 `route` 方法的多重路由更直观明了，也就禁止了出现同函数名或同端点名。`add_url_rule` 为了一个组的路由可以对应一个视图函数的情况，没有强制端点名一定要不同。

#### 7. 自定义规则转换器
[自定义规则转换器](#自定义规则转换器)

#### 端点名
[端点名](#端点名)

#### 指定请求方法

```python
def hello():
    return "hello"

app.add_url_rule('/hello', endpoint="hi", view_func=hello, methods=['GET','POST'])
```

```python
def hello():
    if request.method == 'GET':
        # GET 请求逻辑
    elif request.method == 'POST':
        # POST 请求逻辑

app.add_url_rule('/hello', endpoint="hi", view_func=hello, methods=['GET','POST'])
```

## 视图
用于接受用户请求并返回响应。

### 函数视图：
函数视图必须有响应，不然会报错`TypeError: The view function for '---' did not return a valid response. The function either returned None or ended without a return statement.`

视图函数的返回响应是使用 `return` 语句，会根据返回值最终会调用不同的方法去构建成响应对象再输出，在返回前可以获取 `请求`，根据客户端的请求中的参数或一些元信息做进一步的处理再返回。详细的内容在 `响应` 和 `请求` 篇。

```python
@app.route('/')
def index():
    return "hello world"
```

这个例子中被装饰器装饰的 `index` 函数便是视图函数。

### 类视图：
类视图是一种基于类的方式来实现视图函数，它通过继承 Flask 提供的视图类来创建自定义的视图函数。类视图使得代码更加模块化和易于维护，尤其是在需要实现多个类似功能的视图函数时，可以避免重复代码的编写。

类视图的优点：

1.更好的代码组织

类视图将不同的 HTTP 方法与类视图中的方法关联起来，使代码更加模块化和易于维护。不同的方法对应不同的功能，可以将类视图中的逻辑拆分成多个小的方法，提高代码的可读性和可维护性。

2. 更好的可扩展性

类视图可以很容易地扩展到支持更多的 HTTP 方法，只需要在类视图中添加新的方法即可。同时，类视图可以使用继承机制来实现视图的复用和继承，使得代码更加灵活和易于扩展。

3. 更好的可测试性

类视图可以很方便地进行单元测试和集成测试。由于不同的方法对应不同的功能，可以很容易地对类视图中的每个方法进行针对性的测试。

4. 更好的代码复用

类视图可以很方便地实现代码复用和模块化。不同的类视图可以继承同一个基类，共享基类中的逻辑和属性，减少重复代码的编写。

5. 更好的可读性

类视图的代码结构更加清晰，可以很容易地理解视图中的不同方法对应的功能。同时，类视图可以使用装饰器来实现一些通用的功能，比如用户权限、缓存等，使得代码更加易于理解和维护。

#### 基本类视图：

```python
from flask.views import View

class TestView(View):

    def dispatch_request(self):
        return 'test'


app.add_url_rule('/users/', view_func=TestView.as_view('show_users'))
```

类视图需要继承 `View` 并实现 `dispatch_request` 方法。

`dispatch_request` 方法就是类视图的出口，作用是根据请求的 HTTP 方法，调用对应的类视图方法并返回响应。

返回的内容和函数视图的一样。`as_view` 方法中的参数 'users' 就是该视图的名称。如果没有指定 `endpoint` 有重复的会报异常。指定了 `endponit` 可以重复但不建议。

#### 基于方法调度的视图：

基本类视图如果要根据不同的请求方法需要从请求获取请求方法再去判断，这种方法不用这么麻烦，是要在相应请求方式的方法中写入对应的处理逻辑即可，不用再实现 `dispatch_request` 方法，这个方法在父类用于判断请求方法调用请求方法对应的方法了。如果有需要，也可以重写 dispatch_request 方法，实现自己的请求调度逻辑。

```python
from flask.views import MethodView

class UserAPI(MethodView):

    def get(self):
        users = User.query.all()
        ...

    def post(self):
        user = User.from_form_data(request.form)
        ...

app.add_url_rule('/users/', view_func=UserAPI.as_view('users'))
```

如上的例子：当是以 `get` 方式请求会调用 `UserAPI.get()` ,`post` 则是 `UserAPI.post()`,并且不用在 `add_url_rule` 中传入 `methods` 参数。

### 装饰视图
使用 `route` 方法以装饰器的形式可以很方便的为视图添加装饰器，例如：

```python
from mydecorators import user_required

@app.route('/my-view')
@user_required
def my_view():
    return 'This is a protected view'
```

在这个例子中，`user_required` 装饰器可以用于验证用户是否已经登录，并根据需要处理后续。

而使用 `add_url_rule` 方法则要麻烦一些，尤其是类视图，因为从调用者的角度来看，类的 self 被隐藏了，所以不能在类的方法上单独 使用装饰器。

方法一：

```python
from flask.views import MethodView

class UserAPI(MethodView):

    def get(self):
        users = User.query.all()
        ...

    def post(self):
        user = User.from_form_data(request.form)

def user_required(f):
    """Checks whether user is logged in or raises error 401."""
    def decorator(*args, **kwargs):
        if not g.user:
            abort(401)
        return f(*args, **kwargs)
    return decorator

view = user_required(UserAPI.as_view('users'))
app.add_url_rule('/users/', view_func=view)
```

手工使用 `as_view()` 来装饰返回值

方法二：

自 Flask 0.8 版本开始，新加了一种选择：

在视图类中定义装饰的列表:

```python
class UserAPI(MethodView):
    decorators = [user_required]
```

无论是普通类视图函数基于方法调度都可以使用这种方法。并且可以指定多个装饰器。

```python
from flask import Flask
from mydecorators import login_required, admin_required
from flask.views import View

app = Flask(__name__)

class MyView(View):
    methods = ['GET']
    decorators = [login_required, admin_required]

    def dispatch_request(self):
        return 'This is a protected view'

app.add_url_rule('/my-view', view_func=MyView.as_view('my_view'))
```

### 视图的技巧

#### 可插拔视图：
可插拔视图是 Flask 中一种用于实现可重用视图逻辑的技术。它是在应用程序中定义一些通用的视图逻辑，然后将其打包为插件，供其他应用程序使用。可插拔视图可以让应用程序更加灵活，易于扩展和维护，尤其是在需要实现一些公共的功能模块时，可以避免重复代码的编写。

在一些文章中将 `基于类的视图` 的视图称为 `可插拔视图`。`基于类的视图` 一般添加路由是使用 `add_url_rule` 方法，这保证了视图与路由的隔离。但实际如果传入的是函数视图，具备这个条件，也是 `可插拔视图`。

所以，使用 `add_url_rule` 添加视图的方式就是 `可插拔视图`，但也不是仅限于这个方法。使用 `route` 方法但不是以装饰器方法使用，实现了隔离也是 `可插拔视图`，不过实现的方法比较麻烦而且不是很直观。

#### 默认的延迟加载和惰性加载
延迟加载是 Flask 的默认行为，它会在应用程序启动时将所有的视图函数加载到内存中，并将它们与路由规则绑定。这意味着，当你的应用程序启动时，所有的视图函数都会被加载，无论你是否实际上用到了它们。由于这种加载方式会占用大量的内存，因此在某些情况下可能会导致性能问题和内存限制。

为了解决这个问题，Flask 提供了惰性加载的方式，它只有在需要时才会加载视图函数。惰性加载可以通过使用 Flask 的蓝图(Blueprint)功能来实现，它允许你将应用程序分成多个小模块，每个模块都有自己的路由规则和视图函数。当你需要使用某个模块时，Flask 会自动加载该模块的视图函数和路由规则，并将它们与应用程序中的其他部分合并。

惰性加载的好处是它可以大大减少应用程序的内存占用和启动时间，因为它只会在需要时才加载视图函数和路由规则。另外，惰性加载还可以提高应用程序的可维护性和可扩展性，因为它允许你将应用程序分成多个小模块，并且只加载需要的模块。

需要注意的是，惰性加载需要使用 Flask 的蓝图(Blueprint)功能来实现，因此它需要一些额外的工作来设置和管理。另外，惰性加载可能会对应用程序的性能产生一些负面影响，因为每次加载视图函数和路由规则时都会增加一些开销。因此，你需要权衡应用程序的内存占用、启动时间和性能需求，并选择最适合你的加载方式。

#### 自定义惰性载入视图：
在上面提到的 `可插拔视图` 可以在不同的文件中定义视图，然后在一个文件，比如 "url.py" 中导入这些视图然后使用 `add_url_rule()` 集中注册这些视图。 这就造成一个问题，无论我们去访问还是不去方法一些链接，都会导入并加载所有的视图，希望的是在访问的时候在去导入对应的视图。

下面的例子来自 [惰性载入视图](https://dormousehole.readthedocs.io/en/latest/patterns/lazyloading.html)

```python
from werkzeug.utils import import_string, cached_property

class LazyView(object):

    def __init__(self, import_name):
        self.__module__, self.__name__ = import_name.rsplit('.', 1)
        self.import_name = import_name

    @cached_property
    def view(self):
        return import_string(self.import_name)

    def __call__(self, *args, **kwargs):
        return self.view(*args, **kwargs)
```

上例中最重要的是正确设置 __module__ 和 __name__ ，它被用于在不提供 URL 规则的情况下正确命名 URL 规则。

然后可以这样集中定义 URL 规则:

```python
from flask import Flask
from yourapplication.helpers import LazyView

app = Flask(__name__)
app.add_url_rule('/', view_func=LazyView('yourapplication.views.index'))
app.add_url_rule('/user/<username>', view_func=LazyView('yourapplication.views.user'))

```

还可以进一步优化代码： 写一个函数调用 `add_url_rule()` ， 加上应用前缀和点符号。

```python
def url(import_name, url_rules=[], **options):
    view = LazyView(f"yourapplication.{import_name}")
    for url_rule in url_rules:
        app.add_url_rule(url_rule, view_func=view, **options)

# add a single route to the index view
url('views.index', ['/'])

# add two routes to a single function endpoint
url_rules = ['/user/','/user/<username>']
url('views.user', url_rules)
```

有一件事情要牢记：请求前和请求后处理器必须在第一个请求前导入

#### 用于 API 的方法视图
[用于 API 的方法视图](https://dormousehole.readthedocs.io/en/latest/views.html)

网络 API 经常直接对应 HTTP 变量，因此很有必要实现基于 MethodView 的 API 。即多数时候， API 需要把不同的 URL 规则应用到同一个方法视图。例如，假设你需要这样使用一个 user 对象：

|URL方法|说明|
|---|---|
|/users/| GET 给出一个包含所有用户的列表|
|/users/| POST 创建一个新用户|
|/users/<id>| GET 显示一个用户|
|/users/<id>| PUT 更新一个用户|
|/users/<id>| DELETE 删除一个用户|

那么如何使用 MethodView 来实现呢？ 方法是使用多个规则对应到同一个视图

假设视图是这样的:
```python
class UserAPI(MethodView):

    def get(self, user_id):
        if user_id is None:
            # 返回一个包含所有用户的列表
            pass
        else:
            # 显示一个用户
            pass

    def post(self):
        # 创建一个新用户
        pass

    def delete(self, user_id):
        # 删除一个用户
        pass

    def put(self, user_id):
        # update a single user
        pass
```

那么如何把这个视图挂接到路由系统呢？ 方法是增加两个规则并为每个规则显式声明 方法:

```python
user_view = UserAPI.as_view('user_api')
app.add_url_rule(
    '/users/', 
    defaults={'user_id': None},
    view_func=user_view, 
    methods=['GET',]
    )

app.add_url_rule(
    '/users/', 
    view_func=user_view, 
    methods=['POST',]
    )

app.add_url_rule(
    '/users/<int:user_id>', 
    view_func=user_view,
    methods=['GET', 'PUT', 'DELETE']
    )
```

如果你有许多类似的 API ，那么可以代码如下:

```python
def register_api(view, endpoint, url, pk='id', pk_type='int'):
    view_func = view.as_view(endpoint)
    app.add_url_rule(url, defaults={pk: None},view_func=view_func, methods=['GET',])
    app.add_url_rule(url, view_func=view_func, methods=['POST',])
    app.add_url_rule(f'{url}<{pk_type}:{pk}>', view_func=view_func, methods=['GET', 'PUT', 'DELETE'])

register_api(UserAPI, 'user_api', '/users/', pk='user_id')
```

其实就是封装，这样的做法在后期是很有收益的，较为方便的去管理一系列类型的接口。

## 请求
存储客户端发出的 HTTP 请求信息。

### 方法属性简要说明：

`accept_charsets` :

    此客户端支持的字符集列表作为 CharsetAccept 对象

`accept_encodings` :

    此客户端接受的编码列表。 HTTP 术语中的编码是压缩编码，例如 gzip。对于字符集，请查看 accept_charset。

`accept_languages` :

    此客户端接受作为 LanguageAccept 对象的语言列表

`accept_mimetypes` :

    此客户端接受作为 LanguageAccept 对象的语言列表

`access_control_request_headers` :

    与预检请求一起发送，以指示哪些标头将与跨源请求一起发送。 在响应上设置 access_control_allow_headers 以指示允许哪些标头

`access_control_request_method` :

    与预检请求一起发送，以指示将用于跨源请求的方法。 在响应上设置 access_control_allow_methods 以指示允许哪些方法

`access_route` :

    与预检请求一起发送，以指示将用于跨源请求的方法。 在响应上设置 access_control_allow_methods 以指示允许哪些方法

`application` :

    将函数装饰为接受请求作为最后一个参数的响应者。 这类似于 responder() 装饰器，但函数将请求对象作为最后一个参数传递给该函数，并且请求对象将自动关闭

`args` :

    解析后的 URL 参数（URL 中问号后的部分）

`authorization` :

    授权标头解析为授权对象。 如果标头不存在，则无。
    在 2.3 版更改：授权不再是命令。 为使用令牌而不是参数的身份验证方案添加了令牌属性。

`base_url` :

    类似于 url 但没有查询字符串

`blueprint` :

    当前蓝图的注册名称。
    如果端点不是蓝图的一部分，或者 URL 匹配失败或尚未执行，则这将为 None 。
    这不一定与创建蓝图时使用的名称相匹配。 它可能已被嵌套，或以不同的名称注册

`blueprints` :

    当前蓝图向上通过父蓝图注册的名称。
    如果没有当前蓝图，或者 URL 匹配失败，这将是一个空列表。

`cache_control` :

    传入缓存控制标头的 RequestCacheControl 对象

`charset` :

    传入缓存控制标头的 RequestCacheControl 对象
    2.3 版后已弃用：将在 Werkzeug 2.4 中删除。 请求数据必须始终为 UTF-8

`close` :

     关闭此请求对象的关联资源。 这将显式关闭所有文件句柄。 您还可以在 with 语句中使用请求对象，这将自动关闭它。

`content_encoding` :

    Content-Encoding 实体标头字段用作媒体类型的修饰符。 如果存在，它的值指示哪些附加内容编码已应用于实体主体，因此必须应用哪些解码机制才能获得 Content-Type 标头字段引用的媒体类型。

`content_length` :

    Content-Encoding 实体标头字段用作媒体类型的修饰符。 如果存在，它的值指示哪些附加内容编码已应用于实体主体，因此必须应用哪些解码机制才能获得 Content-Type 标头字段引用的媒体类型。

`content_md5` :

    Content-MD5 实体标头字段，如 RFC 1864 中所定义，是实体主体的 MD5 摘要，用于提供实体主体的端到端消息完整性检查 (MIC)。 （注意：MIC 有利于检测传输中实体主体的意外修改，但不能防止恶意攻击。）

`content_type` :

    Content-MD5 实体标头字段，如 RFC 1864 中所定义，是实体主体的 MD5 摘要，用于提供实体主体的端到端消息完整性检查 (MIC)。 （注意：MIC 有利于检测传输中实体主体的意外修改，但不能防止恶意攻击。）

`cookies` :

    包含随请求传输的所有 cookie 内容的字典

`data` :

    从流中读取的原始数据。 如果请求表示表单数据，则为空。
    要获取原始数据（即使它表示表单数据），请使用 get_data()

`date` :

    Date general-header 字段表示消息发出的日期和时间，与 RFC 822 中的 orig-date 具有相同的语义

`dict_storage_class` :

    werkzeug.datastructures.structures.ImmutableMultiDict 的别名

`encoding_errors` :

    如何处理解码字节时的错误。 默认为“替换”。
    2.3 版后已弃用：将在 Werkzeug 2.4 中删除。

`endpoint` :

    与请求 URL 匹配的端点。
    如果匹配失败或尚未执行，这将为 None 。
    这与 view_args 结合可用于重建相同的 URL 或修改后的 URL

`environ` :

    包含来自 WSGI 服务器的 HTTP 标头和信息的 WSGI 环境

`files` :

    包含所有上传文件的 MultiDict 对象。 文件中的每个键都是 <input type="file" name=""> 中的名称。 files 中的每个值都是一个 Werkzeug FileStorage 对象。

     它的行为基本上类似于您从 Python 了解到的标准文件对象，不同之处在于它还有一个 save() 函数，可以将文件存储在文件系统上。

     请注意，如果请求方法是 POST、PUT 或 PATCH，并且发布到请求的 <form> 具有 enctype="multipart/form-data"，则文件将仅包含数据。 否则它将是空的。

`form` :

    表单参数。 默认情况下，此函数返回一个 ImmutableMultiDict。 这可以通过将 parameter_storage_class 设置为不同的类型来更改。 如果表单数据的顺序很重要，这可能是必要的。

     请记住，文件上传不会在这里结束，而是在文件属性中。

`form_data_parser_class` :

    werkzeug.formparser.FormDataParser 的别名

`from_values` :

    根据提供的值创建一个新的请求对象。 如果给定环境，则从那里填充缺失值。 
    当您需要模拟来自 URL 的请求时，此方法对小脚本很有用。 不要将此方法用于单元测试，有一个功能齐全的客户端对象（客户端）允许创建多部分请求、支持 cookie 等。

     这接受与 EnvironBuilder 相同的选项

`full_path` :

    请求的路径，包括查询字符串

`get_data` :

`get_json` :

    将数据解析为 JSON

`headers` :

    随请求一起收到的标头

`host` :

    向其发出请求的主机名，包括非标准端口。 通过 trusted_hosts 验证

`host_url` :

    仅请求 URL 方案和主机

`if_match` :

    仅请求 URL 方案和主机

`if_modified_since` :

    解析后的 If-Modified-Since 标头作为日期时间对象

`if_none_match` :

    包含 If-None-Match 标头中所有 etags 的对象

`if_range` :

    已解析的 If-Range 标头

`if_unmodified_since` :

    已解析的 If-Unmodified-Since 标头作为日期时间对象

`input_stream` :

    未经任何安全检查的原始 WSGI 输入流。

    这使用起来很危险。 它不防止无限流或读取过去的 content_length 或 max_content_length

    Use stream instead

`is_json` :

    检查 mimetype 是否表示 JSON 数据，application/json 或 application/\*+json

`is_multiprocess` :

    布尔值，如果应用程序由生成多个进程的 WSGI 服务器提供服务，则为 True

`is_multithread` :

    如果应用程序由多线程 WSGI 服务器提供服务，则为 True 的布尔值

`is_run_once` :

    布尔值，如果应用程序在进程生命周期内只执行一次，则为 True。 例如 CGI 就是这种情况，但不能保证只执行一次

`is_secure` :

    如果请求是使用安全协议（HTTPS 或 WSS）发出的，则为真

`json` :

    如果 mimetype 表示 JSON（application/json，请参阅 is_json），则解析的 JSON 数据使用默认参数调用 get_json()。

    如果请求内容类型不是 application/json，这将引发 415 Unsupported Media Type 错误。

    在 2.3 版中更改：引发 415 错误而不是 400。

`list_storage_class` :

    werkzeug.datastructures.structures.ImmutableList 的别名

`make_form_data_parser` :

    创建表单数据解析器。 使用一些参数实例化 form_data_parser_class

`max_content_length` :

    MAX_CONTENT_LENGTH 配置键的只读视图

`max_forwards` :

    Max-Forwards 请求标头字段提供了一种带有 TRACE 和 OPTIONS 方法的机制，以限制可以将请求转发到下一个入站服务器的代理或网关的数量

`method` :

    发出请求的方法，例如 GET

`mimetype` :

    类似于 content_type，但没有参数（例如，没有字符集、类型等）并且总是小写。 例如，如果内容类型是文本/HTML； charset=utf-8 mimetype 将是'text/html'

`mimetype_params` :

    mimetype 参数为 dict。 例如，如果内容类型是 text/html； charset=utf-8 参数将是 {'charset': 'utf-8'}

`on_json_loading_failed` :

    mimetype 参数为 dict。 例如，如果内容类型是 text/html； charset=utf-8 参数将是 {'charset': 'utf-8'}

`origin` :

    werkzeug.datastructures.structures.ImmutableMultiDict 的别名

`parameter_storage_class` :

    werkzeug.datastructures.structures.ImmutableMultiDict 的别名

`path` :

    发出请求的主机。 在响应上设置 access_control_allow_origin 以指示允许哪些来源

`pragma` :

    Pragma general-header 字段用于包含特定于实现的指令，这些指令可能适用于请求/响应链上的任何接收者。 所有 pragma 指令都从协议的角度指定可选行为； 但是，某些系统可能要求行为与指令一致

`query_string` :

    “？”之后的 URL 部分。 这是原始值，对解析值使用 args。

`referrer` :

    Referer[sic] 请求标头字段允许客户端指定，为了服务器的利益，从中获取 Request-URI 的资源的地址（URI）（“referrer”，尽管标头字段拼写错误）

`remote_addr` :

    发送请求的客户端地址

`remote_user` :

    发送请求的客户端地址

`root_path` :

    请求 URL 方案、主机和根路径。 这是访问应用程序的根

`root_url` :

    请求 URL 方案、主机和根路径。 这是访问应用程序的根

`routing_exception` :

    请求使用的协议的 URL 方案，例如 https 或 wss

`scheme` :

    请求使用的协议的 URL 方案，例如 https 或 wss

`script_root` :

    self.root_path 的别名。 environ["SCRIPT_ROOT"] 没有尾部斜杠

`server` :

    服务器的地址。 (host, port), (path, None) 对于 unix 套接字，如果不知道则为 None。

`shallow` :

    服务器的地址。 (host, port), (path, None) 对于 unix 套接字，如果不知道则为 None。

`stream` :

    WSGI 输入流，带有安全检查。 此流只能使用一次。

    使用 get_data() 获取字节或文本形式的完整数据。 只有当它们不代表表单数据时，数据属性才会包含完整的字节。 在这种情况下，表单属性将包含已解析的表单数据。

    与 input_stream 不同，此流防止无限流或读取过去的 content_length 或 max_content_length。

    如果设置了 max_content_length，并且设置了 wsgi.input_terminated，它可以在流上强制执行。 否则，返回一个空流。

    如果在底层流耗尽之前达到限制（例如文件太大，或者无限流），则无法安全地读取流的剩余内容。 根据服务器的处理方式，客户端可能会显示“连接重置”失败，而不是看到 413 响应。

    在 2.3 版更改：在阅读时先发制人地检查 max_content_length

`url` :

    包含方案、主机、根路径、路径和查询字符串的完整请求 URL

`url_charset` :

    解码 args 中的百分比编码字节时使用的字符集。 默认为charset的值，默认为UTF-8。

    2.3 版后已弃用：将在 Werkzeug 2.4 中删除。 百分比编码字节必须始终为 UTF-8

`url_root` :

    root_url 的别名。 带有方案、主机和根路径的 URL。 例如，https://example.com/app/

`url_rule` :

    与请求匹配的内部 URL 规则。 这对于检查来自前/后处理程序 (request.url_rule.methods) 等的 URL 允许哪些方法很有用。尽管如果请求的方法对于 URL 规则无效，则有效列表在 routing_exception.valid_methods 中可用 （Werkzeug 异常 MethodNotAllowed 的一个属性）因为请求从未在内部绑定

`user_agent` :

    用户代理。 使用 user_agent.string 获取标头值。 将 user_agent_class 设置为 UserAgent 的子类，以提供对其他属性或其他扩展数据的解析

`user_agent_class` :

     werkzeug.user_agent.UserAgent 的别名

`values` :

    结合了 args 、 form 的 werkzeug.datastructures.CombinedMultiDict
    对于 GET 请求，只有参数存在，没有 form

`view_args` :

    与请求匹配的视图参数字典。 如果匹配时发生异常，则为 None

`want_form_data_parsed` :

    如果请求方法携带内容则为真。 默认情况下，如果发送了 Content-Type，则为真

### 常用接口使用举例：

`form`: 接受 `POST` 请求的数据，包含表单数据,其返回值是一个字典类。

例如 `<form>` 标签发送过来的 POST 数据。可以使用 `request.form['name']` 或 `request.form.get('name')`访问。

```python
@app.route('/example', methods=['POST'])
def form_example():
    name = request.form['name']
    return str(name)
```

在终端使用 `curl -X POST -d 'name=example' 127.0.0.1:5000/example` 最终返回 `example`


`args`: 包含URL的查询字符串参数,例如 `?name=example_2`。其返回值是一个字典类。可以使用 `request.args.get('name')` 或 `request.args['name']` 访问。

```python
@app.route('/example')
def form_example():
    name = request.args['name']
    return str(name)
```

在终端使用 `curl -X GET  "127.0.0.1:5000/example?name=example_2"` 最终返回 `example_2`

`values`: 包含 `form` 和 `args` 的合集。可以使用 `request.values['name']` 访问。

```python
@app.route('/example', methods=["GET", "POST"])
def form_example():
    print(request.values)
    print(request.method)
    name = request.values['name']
    return str(name)
```

这个例子当使用 `curl -X POST -d 'name=123sdfg' "127.0.0.1:5000/example?name=1"` 访问可以正常访问，但是返回的值是 `1`，比较有迷惑性。

输出结果：
```
127.0.0.1 - - [17/May/2023 08:45:09] "POST /example?name=1 HTTP/1.1" 200 -
CombinedMultiDict([ImmutableMultiDict([('name', '1')]), ImmutableMultiDict([('name', '123sdfg')])])
POST
```

一个 HTTP 请求不能同时是 GET 和 POST 方法。GET 和 POST 是两种不同的HTTP请求方法。GET 请求会将请求参数通过URL查询字符串发送,

例如:`/user?name=john&age=30`

POST 请求会将请求参数通过 HTTP 请求体发送,

例如:
```
POST /user HTTP/1.1
Content-Type: application/x-www-form-urlencoded

name=john&age=30
```

所以一个请求只能选择使用GET或者POST其中一种方法。但是,Flask 的视图函数可以同时支持 GET 和 POST 方法,通过 methods 参数指定:

```python
@app.route('/user', methods=['GET', 'POST'])
def user():
    if request.method == 'POST':
        # 处理POST请求
    else: 
        # 处理GET请求
```

这样的话,同一个URL可以同时响应GET和POST请求,但是每个请求自身仍然只属于 GET 或 POST 其中一种方法。

通过输出也看到，这次请求的模式是 POST 模式，但是输出的结果却解析了链接后的参数，`values` 中会有两个方法的内容，而 "args" 的内容在前，会先被获取到就造成了是 GET 请求的假象。这里猜测 `args` 解析参数可能并没有强检验请求方法而是直接根据链接用正则取内容了。

### 自定义请求类
Flask 允许我们定义自己的 `Request` 类,就像 `Response` 一样。

我们可以这样定义一个Request类:

```python
from flask import Request

class MyRequest(Request):
    # 重写一些方法和属性
```

然后在 Flask app 上将 request_class 指定为我们的类:

```python
from flask import Flask
from myrequest import MyRequest 

app = Flask(__name__)
app.request_class = MyRequest
```

现在这个 app 会使用 MyRequest 类来处理所有请求,而不是默认的 Request 类。

我们可以在自定义的请求类中:

1. 重写或添加新的方法, 例如:

```python
class MyRequest(Request):
    def validate(self):
        # 验证请求中的参数等
        pass 
```

 2. 定制添加新的属性, 例如:

```python
class MyRequest(Request):
    @property
    def timestamp(self):
        return self.headers.get('X-Timestamp')
```

3. 在初始化方法中执行自定义代码:

```python
class MyRequest(Request):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # 执行一些初始化代码
```

4. 重写已有方法的行为,例如:

```python  
class MyRequest(Request):
    def get_json(self, force=False, silent=False, cache=True):
        # 定制get_json方法的行为
```

所以,与Response类似,我们也可以全面定制 Flask 请求的各个方面。这让我们有更大的灵活性来处理请求。

一些常见的自定义 Request 用途有:

1. 角色/权限验证

```python
class RoleRequest(Request):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        role = self.headers.get('X-Role')
        if not self.has_role(role):
            abort(403)  # Forbidden
            
    def has_role(self, role):
        # 判断角色是否有权限访问当前请求
        ...
```

2. 验证请求参数

```python 
class ValidatedRequest(Request):
    def validate(self):
        name = self.form.get('name')
        if not name:
            abort(400, 'Name is required')  # Bad Request
            
        age = self.form.get('age')
        if age and not age.isnumeric():
            abort(400, 'Age must be numeric')
```

3. 定制 get_json

```python
class JSONRequest(Request):
    def get_json(self, force=False, silent=False, cache=True):
        # 先从自定义的请求头X-Data中解析JSON
        data = self.headers.get('X-Data')
        if data:
            return json.loads(data)
        # 否则调用父类的get_json方法
        return super().get_json(force, silent, cache) 
```

4. 日志记录

```python
class LoggingRequest(Request):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        logger.info(f'{self.method} {self.url}')  # 记录请求信息
```

5. 监控和统计

```python
class StatisticRequest(Request):
    counter = 0
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        StatisticRequest.counter += 1  # 请求计数器
        
    def statistic(self):
        # 返回各种统计信息
        return {
            'request_count': StatisticRequest.counter
        } 
```

## 响应
用于当视图函数结束后向客户端返回响应。

可以返回以下这些内容。

    1. 字符串(str): 会以 UTF-8 编码作为响应体构建响应对象。
    2. 字节(bytes): 会作为响应体构建响应对象。
    3. 字典(dict): 会被 jsonify 后作为响应体构建响应对象。 
    4. 列表(list): 会被 jsonify 后作为响应体构建响应对象。
    5. 生成器(generator): 会被流式处理,生成的字符串或字节会作为响应体构建响应对象。
    6. 元组(tuple): 元组可以是 (body, status, headers)、(body, status) 或 (body, headers) 的形式。body 可以是上述类型,status 可以是字符串或整数,headers 可以是字典或(key, value)元组列表。如果 body 是响应对象,status 会覆盖其原有值,headers 会被扩展。
    7. 响应对象(Response): 对象会直接返回。
    8. 其他 Werkzeug 响应对象: 对象会被强制转换为 Flask.response_class。
    9. 可调用对象(callable): 会作为 WSGI 应用调用,结果用于构建响应对象。
    10. jsonify 对象
    11. 空值。 注意这里的空值不是代表 `None`,而是空字符串，空字典等支持的数据的的空类型。`None` 不允许,会引发 TypeError。 
    12. render_template() 该方法根据传入的模板和参数使用 jinja 创建响应对象。
    13. redirect() 该方法是跳转至另一个 url，跳转至的 url 的视图函数的返回要遵循以上条件。

挑几个重点难点举例：

```python
# 响应对象(Response):
from flask import Response

@app.route('/')
def index():
    resp = Response('Response Body', 200)
    return resp

```

```python
# 其他 Werkzeug 响应对象:

from werkzeug.wrappers import Response

@app.route('/') 
def index():
    resp = Response('Werkzeug Response', 200) 
    return resp 
```

```python
# jsonify 对象:

@app.route('/')
def index():
    data = {
        'name': 'John',
        'age': 30
    }
    return jsonify(data)
```

```python
# 可调用对象(callable):

def generate_response():
    def resp(environ, start_response):
        start_response('200 OK', [('Content-Type', 'text/html')])
        yield '<h1>Hello World!</h1>'
    return resp

@app.route('/')
def index():
    return generate_response()
```

这段代码是使用了 Python 的 WSGI(Web Server Gateway Interface) 标准，WSGI 规定了一套应用程序和 Web 服务器之间的接口。在这个规范中，应用程序处理请求的方式是定义一个函数，这个函数接受两个参数：environ 和 start_response。

在这段代码中，generate_response() 函数返回了一个 resp 函数，而 resp 函数接受两个参数：environ 和 start_response。这两个参数是由 WSGI 服务器传递给应用程序的，因此在这个例子中，这两个参数并没有被直接传递或导入，而是由 WSGI 服务器自动传递给应用程序。

在 Flask 框架中，使用 @app.route 装饰器来定义 URL 路由，当接收到对应的请求时，Flask 会自动调用对应的函数。在这个例子中，当接收到根路由（'/'）的请求时，Flask 调用 index() 函数，而 index() 函数又返回了 generate_response() 函数生成的 resp 函数。最终，WSGI 服务器会调用 resp 函数，并传递 environ 和 start_response 参数，使得 resp 函数能够正常处理请求，并返回响应。

TODO 这段没有太深入，后续有空补上细节。其实也不确定这个例子对不对。

```python
@app.route('/test')
def test():
    def input_number():
        for i in range(10):
            time.sleep(2)
            yield str(i)
    return input_number()
```

生成器对象，这里增加延时的作用是让其在浏览器预览时有更直观的显示，数字是一个个增加的，如果没有延时，一瞬间全拼接完成了，会造成是在后端全部获取完拼接再返回的错觉。

在浏览器的控制台是只能看到一个请求的，如果要确认是不是一个个发送的，可以使用 `wireshark` 等抓包工具对每一个 `tcp` 请求解析。

### 自定义响应类的应用场景
1. 返回定制的响应体格式我们可以重写 `Response` 类的 `get_data` 方法来返回定制的响应体格式,

例如:

```python
class XMLResponse(Response):
    def get_data(self):
        return f'<xml>{self.response}</xml>'.encode()
```

然后在视图函数中返回 `XMLResponse()` 对象,就会返回XML格式的响应体。

2. 设置定制的响应头我们可以在 `Response` 子类的构造方法中设置自定义的响应头:

```python
class HeaderResponse(Response):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.headers['X-Header'] = 'Value'
```

3. 返回定制的响应状态码我们可以重写 `Response` 子类的 `status_code` 属性来设置自定义状态码:

```python
class CodeResponse(Response):
    @property
    def status_code(self):
        return 202  # 返回202 Accepted状态码
```

4. 添加定制行为我们可以在 `Response` 子类中添加各种定制方法来实现自定义逻辑,例如:

```python
class LoggingResponse(Response):
    def log_response(self):
        logger.info(f'Sending {self.status_code} response')
```

然后在视图函数中调用该方法:

```python
@app.route('/')  
def index():
    response = LoggingResponse('Hello')
    response.log_response()  # 记录响应日志
    return response
```

5. 返回定制的内容我们可以重写 `get_data` 方法来返回定制的内容,例如:

```python 
class HTMLResponse(Response):
    def get_data(self):
        return '<h1>Hello World!</h1>'.encode()
```

然后在视图函数中返回 `HTMLResponse()` 对象就可以返回HTML内容。

------

自定义响应类有以下主要应用场景:

1. 统一响应格式。开发 API 时,通常会设定统一的响应格式,比如都返回 JSON 数据。自定义响应类可以实现这个统一格式,所有的 API 都返回该响应类的实例。

```py
class APIResponse:
    def __init__(self, data):
        self.data = data
```

所有 API 都返回 APIResponse 实例,格式统一。

2. 添加额外数据。除了响应的数据外,还可以在响应中添加其他通用数据,比如状态码、错误消息等。

```python
class APIResponse:
    def __init__(self, data, status, error=None):
        self.data = data
        self.status = status
        self.error = error
```

响应包含 status 状态码和可选的 error 错误信息。

3. 分页数据。如果 API 返回分页的数据,响应类可以封装分页相关信息,如当前页码、每页条数、总条数等。

```python
class PaginatedResponse:
    def __init__(self, data, page, per_page, total):
        self.data = data
        self.page = page  # 当前页码
        self.per_page = per_page  # 每页条数
        self.total = total  # 总条数
```

响应包含分页元数据,客户端可以根据这些数据构造分页 UI。

4. 错误响应。可以在响应类中定义错误响应的格式,统一处理所有 API 的错误响应。

```python
class APIErrorResponse:
    def __init__(self, error_code, error_msg):
        self.error_code = error_code
        self.error_msg = error_msg
```

发生错误时,API 返回此错误响应。客户端可以根据错误码和消息进行相应处理。

5. 元数据。响应类可以包含请求的元数据,比如请求路径、请求参数等。

```python
class APIResponse:
    def __init__(self, data, request):
        self.data = data
        self.request_path = request.path  # 请求路径
        self.request_args = request.args  # 查询参数
```

响应包含请求的路径和查询参数等元数据。

6. 安全性。在响应类中可以加入安全相关数据,比如加密签名等。

```python
class APIResponse:
    def __init__(self, data, signature):
        self.data = data
        self.signature = signature  # 数字签名
```

响应包含数字签名,客户端可以验证签名以确保响应没有被篡改。

7. 版本控制。如果 API 有版本控制,可以在响应类中加入版本号,以指明响应对应哪个 API 版本。

```python
class APIResponse:
    def __init__(self, data, api_version):
        self.data = data
        self.api_version = api_version  # API 版本号
```

响应标明所对应 API 的版本,客户端可以根据版本号选择使用兼容的逻辑。

8. 扩展性。自定义响应类可以方便未来的扩展,比如添加更多字段等。使用统一响应格式的好处就是客户端无需关心新添加的字段。

原响应类:

```python
class APIResponse:
    def __init__(self, data):
        self.data = data
```

后续添加新的字段:

```python
class APIResponse:
    def __init__(self, data, total):
        self.data = data
        self.total = total  # 新增总数字段
```

由于客户端本来就期望获取 APIResponse 实例,所以这种扩展对客户端透明,客户端无需变更就可以获取新添加的 total 字段的值。

9. 转换工具。可以为响应类编写转换工具,比如将响应类转为其他格式,比如 XML、CSV 等。

```python
class APIResponse:
    def __init__(self, data):
        self.data = data

def to_xml(response):
    # 将 APIResponse 实例转换为 XML
    ...

def to_csv(response):
    # 将 APIResponse 实例转换为 CSV
    ...
```

我们为 APIResponse 定义了 `to_xml()` 和 `to_csv()` 等方法将其转换为其他格式。客户端可以按需调用这些方法。

10. 缓存。响应类可以加入缓存相关的元数据,以指示客户端如何缓存响应。等等。

```python
class APIResponse:
    def __init__(self, data, cache_control):
        self.data = data
        self.cache_control = cache_control
```

响应包含 `Cache-Control` 头信息,客户端可以根据此信息缓存响应并在将来重用。比如:

`response = APIResponse(data, 'public, max-age=3600')`

表示响应可以公开缓存,并在 3600 秒内重用。clients 可以缓存该响应, 并在未来 1 小时内直接从缓存中获取数据而不再请求 API。

### 响应的几种方式说明

这里以返回生成器类型为例：

1. 视图直接返回

```python
@app.route('/hello')
def hello():
    def generate():
        yield 'Hello '
        yield 'world!'
    return generate()
```

实际视图 `return` 的值会被 `make_response()` 接管并做后续的处理。

2. 使用 `make_response()`

```python
from flask import make_response

@app.route('/hello')
def hello():
    def generate():
        yield 'Hello '
        yield 'world!'
    return make_response(generate())
```

3. 使用 `Response`

```python
from flask import Response

@app.route('/hello')
def hello():
    def generate():
        yield 'Hello '
        yield 'world!'
    return Response(generate())
```

4. 使用 `response_class`

`response_class` 实际就是 `Response`，源码中 `response_class=Response`

```python
from flask import Flask

app = Flask(__name__)

@app.route('/hello')
def hello():
    def generate():
        yield 'Hello '
        yield 'world!'
    return app.response_class(generate())
```

5. 从 `werkzeug` 的基类构建

前面介绍的方法最后都是调用 `werkzeug` 的，所以导入 `werkzeug` 的基类构建是可行的。

```python
from werkzeug.wrappers import Response

@app.route('/hello')
def hello():
    def generate():
        yield 'Hello '
        yield 'world!'
    response = Response(generate())
    return response
```

### 流内容
在 Flask 中，使用流（stream）可以将响应内容分成多个部分逐步发送给客户端，而不是一次性将整个响应返回。这种方式可以在服务器处理响应时，逐步生成数据，并在生成数据的同时将其发送给客户端，从而缩短客户端等待响应的时间。

使用流的情况通常包括以下几种：

1. 处理大量数据：如果需要处理大量数据，例如生成大型报告或下载大型文件，使用流可以避免在服务器上生成整个响应并将其保存在内存中，从而节省服务器资源。

2. 长时间运行的请求：如果需要处理长时间运行的请求，例如实时监视系统，使用流可以使客户端能够及时接收到服务器生成的数据，并更新页面。

3. 实时应用程序：如果需要构建实时应用程序，例如聊天应用程序或实时游戏，使用流可以使服务器将数据推送给客户端，而不是等待客户端请求数据。

使用流的好处包括：

1. 更快的响应时间：使用流可以在生成数据的同时将其发送给客户端，从而缩短客户端等待响应的时间。

2. 节省服务器资源：使用流可以避免在服务器上生成整个响应并将其保存在内存中，从而节省服务器资源。

3. 更好的用户体验：使用流可以使客户端能够及时接收到服务器生成的数据，并更新页面，从而提供更好的用户体验。

#### 生成器(Generators)
使用生成器（generator）来创建流（stream），以逐步生成响应的内容并将其发送给客户端。生成器是一种特殊的迭代器，它可以在需要时动态生成数据，并且只在需要时占用内存，因此非常适合用于生成大量数据的应用程序。

```python
@app.route('/stream')
def streamed_response():
    def generate():
        yield 'Hello '
        yield str(request.args.get('name'))
        yield 'world'
    return generate()
```

```python
from flask import Response, request

@app.route('/stream')
def streamed_response():
    def generate():
        yield 'Hello '
        yield str(request.args.get('name'))
        yield 'world'
    return Response(generate())
```

这两个例子都只返回 `Hello `，后面的内容没有输出，并且在终端输出了 `RuntimeError: Working outside of request context.` 异常，原因是 `request.args.get('name')` 尝试去获取返回的参数，但并不是错在没有返回值，而是这个方法只能在该请求的情境中使用，即请求上下文中。而这样简单使用生成器导致数据被隔离到情境外，也就引发了异常。如果需要保持生成器在情境中，就需要使用 `stream_with_context()` 方法

##### stream_with_context() 方法的使用（ 情境中的流内容 ）
在 Flask 中，请求上下文是指在每个请求处理期间，Flask 将请求信息存储在一个全局上下文对象中，以方便在应用程序中访问。请求上下文包含与请求相关的所有信息，例如请求头、请求方法、请求参数和请求正文等。

在 Flask 应用中，请求上下文只在请求处理期间存在，并且不能在请求处理之外访问。这意味着如果想要在请求处理之外（例如在生成器函数中）访问请求上下文，则需要在生成器函数中使用 `stream_with_context()` 函数来保持请求上下文的存在。

如果不使用 `stream_with_context()` 函数，则请求上下文在生成器函数开始执行时不存在，因此会引发 `RuntimeError` 错误。

```python
from flask import Response, request, stream_with_context

@app.route('/stream')
def streamed_():
    def generate():
        yield 'Hello '
        yield str(request.args.get('name'))
        yield 'world'
    return Response(stream_with_context(generate()))
```

这样就能正常输出 `Hello Noneworld`

#### 文件流
#### 流模板 {#流内容-流模板}
`3.X` 版本之前需要自己实现，现在有直接使用的方法 `stream_template()` `stream_template_string()`

并且都能在情境中使用（在构造代码中已经使用了 `stream_with_context()` 方法），无需再麻烦的构建。

##### 流文件模板
这个内容在 `3.X` 之前需要自己构建（官方文档给出了参考例子），但现在已经有内置方法了。

`3.X`  之前的实现方法：

```python
def stream_template(template_name, **context):
    app.update_template_context(context)
    t = app.jinja_env.get_template(template_name)
    rv = t.stream(context)
    rv.enable_buffering(5)
    return rv


def iter_all_rows():
    for i in range(1000):
        time.sleep(1)
        yield [str(i), str(i)+"1", str(i)+"2", str(i)+"3", str(i)+"4"]


@app.route('/stream')
def render_large_template():
    rows = iter_all_rows()
    return Response(stream_template('stream.html', rows=rows))
```

`stream.html`：

```html
<!DOCTYPE html>
<html>
<head>
    <title>My Large Page</title>
</head>
<body>
    <table>
        {% for row in rows %}
            <tr>
                {% for cell in row %}
                    <td>{{ cell }}</td>
                {% endfor %}
            </tr>
        {% endfor %}
    </table>
    <div>footbar</div>
</body>
</html>
```

这个实现会在模板中逐步渲染再输出，针对有大量数据需要渲染的情况，可以减少后端的压力，不至于一次性读取所有的数据并渲染，既能保证安全性的同时针对前端的使用体验也更好，假如渲染是需要大量时间的情况下，前端页面不会处于一直等待的情况。

`3.X` 版本：

```python
from flask import Flask, stream_template
import time
app = Flask(__name__)

def iter_all_rows():
    for i in range(1000):
        time.sleep(1)
        yield [str(i), str(i)+"1", str(i)+"2", str(i)+"3", str(i)+"4"]

@app.route('/stream')
def render_large_template():
    rows = iter_all_rows()
    return stream_template('stream.html', rows=rows)
```

##### 流字符串模板
不是从模板文件而是从模板字串构建的方法类似。

```python

template_str = """<!DOCTYPE html>
    <html>
    <head>
        <title>My Large Page</title>
    </head>
    <body>
        <table>
            {% for row in rows %}
                <tr>
                    {% for cell in row %}
                        <td>{{ cell }}</td>
                    {% endfor %}
                </tr>
            {% endfor %}
        </table>
        <div>footbar</div>
    </body>
    </html>
"""

def stream_template(source, **context):
    app.update_template_context(context)
    t = app.jinja_env.from_string(source)
    rv = t.stream(context)
    rv.enable_buffering(5)
    return rv


def iter_all_rows():
    for i in range(1000):
        time.sleep(0.1)
        yield [str(i), str(i)+"1", str(i)+"2", str(i)+"3", str(i)+"4"]


@app.route('/stream')
def render_large_template():
    rows = iter_all_rows()
    return Response(stream_template(template_str, rows=rows))
```

`3.X` 版本：

```python
from flask import Flask, stream_template_string, Response
import time


app = Flask(__name__)

template_str = """<!DOCTYPE html>
    <html>
    <head>
        <title>My Large Page</title>
    </head>
    <body>
        <table>
            {% for row in rows %}
                <tr>
                    {% for cell in row %}
                        <td>{{ cell }}</td>
                    {% endfor %}
                </tr>
            {% endfor %}
        </table>
        <div>footbar</div>
    </body>
    </html>
"""


def iter_all_rows():
    for i in range(1000):
        time.sleep(0.1)
        yield [str(i), str(i)+"1", str(i)+"2", str(i)+"3", str(i)+"4"]


@app.route('/stream')
def render_large_template():
    rows = iter_all_rows()
    return Response(stream_template_string(template_str, rows=rows))
```

## url 构建
 `url_for()` 函数用于构建指定函数名(端点名)的 URL。

 说函数名是不正确的。因为平常的开发中会避免使用重名的函数名，并且不会指定 `endpoint` 参数，而没有指定 `endpoint` 参数的化会将视图函数名作为缺省值，就造成了传入的是函数名的假象。

 它有几个主要的用处:

1. 构建 URLs, 而不硬编码路由名称。这使得你的应用更改路由名称也不会影响 URL。使应用更加模块化和可维护。
2. 生成 URL 时会考虑应用中定义的 URL 转换器和重定向。
3. 如果你的应用部署在子目录下, url_for() 会自动处理好。
4. 在 URL 构建过程中, 会考虑 URL 变量的值。

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
    
2. \_anchor : 为 URL 添加锚点。

3. \_method : 为 URL 设置 HTTP 方法。

4. \_scheme : URL 的协议 schemes (http, https, ftp, etc.) 。只在 \_external=True 时有效。

5. \_external : 如果设置为 True, 则生成的 URL 将是绝对路径,包含域名和协议部分。默认为 False, 生成相对路径。

6. \*\*values : 动态参数以关键字参数的形式传入。这些参数会被插入到 URL 中相应的位置。

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
`url_for` 函数使用了 `*` 语法糖，除了第一个参数可以使用位置参数，其他的必须使用关键字参数。

## 重定向
重定向状态码主要有:

    - 301 Moved Permanently : 永久重定向。表示请求的资源已永久转移到新位置。浏览器会自动更新书签。
    - 302 Found             : 临时重定向。表示请求的资源暂时转移到新位置。浏览器不会自动更新书签。
    - 303 See Other        : 重定向到其他URI。表示请求的资源可在另一个URI上找到。浏览器会自动查看新URI并获取资源。
    - 304 Not Modified      : 资源未改变。表示客户端已经在本地缓存了此资源的副本,服务器判断资源未改变,返回 304 告诉客户端使用本地缓存的副本。
    - 307 Temporary Redirect: 临时重定向。和 302 Found 类似,表示资源暂时转移到新位置。浏览器不会自动更新书签。
    - 308 Permanent Redirect: 永久重定向。和 301 Moved Permanently 类似,表示资源已永久转移到新位置。浏览器会自动更新书签。

需要注意的是, HTTP 协议中并没有 306 状态码。某些服务器软件使用 306 表示资源暂时转移,但这是非标准用法,正确的方式应该使用 302 或 307

```python
redirect(
    location: str, 
    code: int = 302, 
    Response: type[Response] | None = None
)
```

参数说明：

    `location` : 重定向的目标 URL,可以是本地链接也可以是跨域链接
    `code`： 重定向的状态码, 默认是 302
    `Response` : 可选的参数,指定重定向响应的类型。默认是 Flask 的响应对象

通常和 `url_for` 方法一起使用，更优雅的重定向

## 上传文件

### 单文件

前端：`file.html`

```html
<form method="POST" enctype="multipart/form-data" action="upload">
    <input type="file" name="file">
    <button type="submit">Upload</button>
</form>
```

`input` 标签中的 `type="file"` 表示这是一个文件上传字段，用户可以使用它来选择要上传的文件。`name="file"` 表示这个上传字段的名称为 `file`，在表单提交时，上传的文件将作为一个名为 `file` 的键值对发送到服务器。

`action="upload"` 用于指定上传的 url，如果为空则是像当前链接发送数据。

后端：

```python
@app.route("/")
def index():
    return render_template("file.html")


@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files['file']
    filename = file.filename
    file.save(filename)
    return 'File saved'
```

在 Flask 应用程序中，通过使用 `request.files` 获取上传的文件。在这个例子中，`request.files['file']` 获取的是前端上传表单中名为 file 的文件字段，即上传的一个或多个文件。

### 多文件

前端： `file.html`

```html
<form method="POST" enctype="multipart/form-data" action="upload">
    <input type="file" name="file" multiple>
    <button type="submit">Upload</button>
</form>
```
`input` 标签添加 `multiple` 属性可以一次性选择多个文件

后端：

```python
@app.route("/")
def index():
    return render_template("file.html")

@app.route('/upload', methods=['POST'])
def upload_files():
    files = request.files.getlist('file')
    for file in files:
        filename = secure_filename(file.filename)
        file.save(filename)  
    return 'Files saved'
```

如果表单中有多个文件上传字段，可以使用 `request.files.getlist('file')` 获取所有上传的文件列表。


### 安全问题
1. 文件覆盖: 如果允许用户上传同名文件,可能导致原文件被覆盖。解决方案是为每个文件生成唯一文件名。

2. 任意文件上传: 恶意用户可能上传任意文件(脚本文件等)。解决方案是校验文件扩展名,只允许特定类型的文件上传。

3. 文件路径攻击: 用户可能通过文件路径来读取或写入服务器上的其他文件。解决方案是将文件保存到专用的上传文件夹,并使用 `secure_filename()` 过滤文件名。

4. 文件内容攻击: 上传的文件内容可能包含恶意代码或病毒。解决方案是对文件内容进行扫描、过滤等。

5. 文件大小攻击: 超大文件可能导致服务器宕机或拒绝服务。解决方案是限制上传文件的最大尺寸。

一个比较全面的例子：

实现了多文件上传应用，保证文件名唯一，只保存图片文件，最大为20M，使用 secure_filename() 过滤文件名保证安全性，前端会计算文件哈希值并一起上传，后端保存完成后检验这个值，一样则返回成功，不一样则删除，全部一样则返回上传成功，有不一样的则返回不一样的文件名和哈希值

```html
<!doctype html>
<html>
  <head>
    <title>File Upload</title>
  </head>
  <body>
    <h1>Upload Files</h1>
    <form action="/upload" method="POST" enctype="multipart/form-data">
      <input type="file" name="files[]" multiple>
      <input type="hidden" name="hashes[]" value="">
      <!-- 请在提交之前使用 JavaScript 计算文件哈希值并将其放入上面的隐藏输入字段中 -->
      <input type="submit" value="Upload">
    </form>
  </body>
</html>
```

```python
from flask import Flask, render_template, request, jsonify
from werkzeug.utils import secure_filename
import os
import hashlib

# 创建 Flask 应用
app = Flask(__name__)

# 设置上传文件夹和允许的文件扩展名
app.config['UPLOAD_FOLDER'] = 'uploads'
app.config['ALLOWED_EXTENSIONS'] = {'png', 'jpg', 'jpeg', 'gif'}
app.config['MAX_CONTENT_LENGTH'] = 20 * 1024 * 1024  # 20MB


# 检查文件扩展名是否允许
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in app.config['ALLOWED_EXTENSIONS']


# 计算文件的哈希值
def calculate_hash(file):
    sha256 = hashlib.sha256()
    for buf in iter(lambda: file.read(8192), b''):
        sha256.update(buf)
    return sha256.hexdigest()


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/upload', methods=['POST'])
def upload_file():
    if 'files[]' not in request.files:
        return jsonify(success=False, error='No file part in the request.')

    files = request.files.getlist('files[]')
    hashes = request.form.getlist('hashes[]')

    print(files, len(files))
    print(request.form, len(hashes))
    if not files or not hashes or len(files) != len(hashes):
        return jsonify(success=False, error='Invalid request.')

    invalid_files = []

    for idx, file in enumerate(files):
        if file.filename == '':
            return jsonify(success=False, error='No selected file.')

        if not allowed_file(file.filename):
            invalid_files.append((file.filename, 'Invalid file type.'))
            continue

        # 使用 secure_filename() 过滤文件名
        filename = secure_filename(file.filename)

        # 检查文件大小
        file.seek(0, os.SEEK_END)
        file_size = file.tell()
        if file_size > app.config['MAX_CONTENT_LENGTH']:
            invalid_files.append((filename, 'File size exceeds 20MB.'))
            continue

        # 计算文件哈希值
        file.seek(0)
        file_hash = calculate_hash(file)

        if file_hash != hashes[idx]:
            invalid_files.append((filename, 'Hash mismatch.'))
            continue

        # 保存文件
        file.seek(0)
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

    if invalid_files:
        return jsonify(success=False, invalid_files=invalid_files)
    else:
        return jsonify(success=True)


if __name__ == '__main__':
    app.run(debug=True)
```

## 发送文件
### `send_file()` 直接发送文件:

```python
send_file(
    path_or_file: os.PathLike | str | t.IO[bytes],
    environ: WSGIEnvironment,
    mimetype: str | None = None,
    as_attachment: bool = False,
    download_name: str | None = None,
    conditional: bool = True,
    etag: bool | str = True,
    last_modified: datetime | int | float | None = None,
    max_age: None | (int | t.Callable[[str | None], int | None]) = None,
    use_x_sendfile: bool = False,
    response_class: type[Response] | None = None,
    _root_path: os.PathLike | str | None = None,
)
```

- path_or_file: 要发送的文件路径或文件对象。可以是字符串路径,os.PathLike 对象,或二进制文件对象。
- mimetype: 发送文件的 MIME 类型。如果省略, Flask 会试图猜测 MIME 类型。
- as_attachment: 是否作为附件发送文件。如果为 True,浏览器会提示下载该文件。
- download_name: 下载文件的默认名称。如果省略,使用文件名。
- conditional: 是否遵循 HTTP 缓存验证机制。如果为 True, Flask 会生成一个 ETag 响应头并检查 If-None-Match 请求头。
- etag: ETag 的生成方式。可以是 bool、字符串或 None。如果为 True,使用文件修改时间生成 ETag。
- last_modified: 文件的最后修改日期。用于生成 ETag 或检查条件请求。
- max_age: 设置 Cache-Control 头的 max-age 值。可以是整型秒数或返回整型秒数的可调用对象。
- use_x_sendfile: 是否使用 X-Sendfile 头。如果为 True,文件数据不会经过 Flask,直接由 web 服务器发送给客户端。这可以提高效率。需要 web 服务器支持 X-Sendfile 功能。
- response_class: 用于创建响应对象的类。默认是 flask.Response。可以自定义响应类并传入。
- `_root_path`: 用于找到文件的根目录。如果指定了,可以将相对于 `_root_path` 的路径传给 `path_or_file` 参数。这个参数主要用于创建 Flask 实例时设置静态文件夹。

```python
from flask import send_file

@app.route('/download')
def download_file():
    return send_file('path/to/file')
```

#### `send_from_directory()` 从指定目录发送文件:

这个方式的底层实际是调用了 `send_file` 方法，想要设置相应的参数，可以以关键字参数的形式传递。

```python
from flask import send_from_directory

@app.route('/download') 
def download_file():
    return send_from_directory('path/to/folder/', 'file.txt')
```

#### 构建响应来实现文件下载
```python
DOWNLOAD_DIR = "/home/aiyoyo/Documents/pro/002/test_app"


@app.route('/download/<filename>')
def download(filename):
    path = os.path.join(DOWNLOAD_DIR, filename)
    response = Response(open(path, 'rb').read())
    response.headers['Content-Type'] = 'application/octet-stream'
    response.headers['Content-Disposition'] = 'attachment; filename=' + filename
    return response
```

需要注意的是，使用这种方法下载大文件可能会导致性能问题，因为整个文件都会加载到内存中。为了避免这个问题，可以使用较小的缓冲区逐块读取文件并发送响应。

设置 `Content-Type` 和 `Content-Disposition` 响应头通常是下载文件时必须的，因为它们告诉浏览器如何处理文件。

下面是这两个头部的具体作用：

`Content-Type`：指定下载文件的 MIME 类型。MIME 类型是一种标准化的文件类型表示方法，它告诉浏览器如何处理下载文件。

例如，对于 PDF 文件，MIME 类型通常为 `application/pdf`。

如果没有设置 `Content-Type` 头部，浏览器可能无法正确处理下载文件，或者可能会将其解释为不正确的文件类型。

`Content-Disposition`： 指示浏览器如何展示下载文件。该头部的值通常为 attachment，表示下载文件应该保存在本地文件系统中，而不是在浏览器中打开。

此外， `Content-Disposition` 还可以设置文件名，以确保下载文件的名称与原始文件名相同。

如果没有设置 `Content-Disposition` 头部，浏览器可能会打开下载文件而不是将其保存到本地文件系统中。

```python
@app.route('/download/<path:filename>')
def download(filename):
    # 检查文件是否存在
    if not os.path.isfile(filename):
        return "File not found", 404

    # 获取文件大小和修改时间
    file_size = os.path.getsize(filename)
    modified_time = os.path.getmtime(filename)

    # 检查是否支持断点续传
    range_header = request.headers.get('Range', None)
    if range_header:
        # 解析 Range 头部信息
        start, end = parse_range_header(range_header, file_size)
        content_length = end - start + 1
        status_code = 206
    else:
        start = 0
        end = file_size - 1
        content_length = file_size
        status_code = 200

    # 构造响应头部信息
    headers = {
        'Content-Range': 'bytes {0}-{1}/{2}'.format(start, end, file_size),
        'Accept-Ranges': 'bytes',
        'Content-Length': content_length,
        'Last-Modified': time.strftime('%a, %d %b %Y %H:%M:%S GMT', time.gmtime(modified_time)),
        'Content-Disposition': 'attachment; filename=' + filename
    }

    # 限制下载速率
    def generate_file():
        with open(filename, 'rb') as f:
            f.seek(start)
            remaining_bytes = content_length
            while remaining_bytes > 0:
                chunk_size = min(1024 * 1024, remaining_bytes)
                chunk = f.read(chunk_size)
                if not chunk:
                    break
                yield chunk
                time.sleep(0.1)  # 限制下载速率为 10MB/s
                remaining_bytes -= chunk_size

    # 返回响应
    return Response(
        generate_file(),
        headers=headers,
        status=status_code,
        content_type='application/octet-stream'
        )


def parse_range_header(range_header, file_size):
    # 解析 Range 头部信息，返回起始和结束位置
    range_pattern = r'bytes=(\d*)-(\d*)'
    m = re.match(range_pattern, range_header)
    if m:
        start = int(m.group(1)) if m.group(1) else 0
        end = int(m.group(2)) if m.group(2) else file_size - 1
    else:
        start = 0
        end = file_size - 1
    return start, end
```

一个更好的例子，做了一些验证，限制了下载速度，并且实现了断点续传

#### send_static_file()
作用是在应用程序中动态地发送静态文件，而不是让用户通过链接直接访问它们。

应用场景：

1. 发送静态文件：

最常见的使用场景是发送静态文件，例如图片、CSS、JavaScript 和字体文件等。如果静态文件目录在应用程序根目录下的 static 文件夹中，那么可以使用 send_static_file() 方法来发送文件，

如下所示：

```python
@app.route('/static/<path:filename>')
def serve_static(filename):
    return send_static_file(filename)
```

在上面的代码中，<path:filename>是一个动态的URL参数，它可以匹配静态文件目录中包含子目录的文件路径。

2. 动态生成静态文件：

有时我们需要在运行时动态地生成静态文件，比如将用户上传的图像转换为缩略图并保存在静态目录中。在这种情况下，我们可以使用send_static_file() 方法来发送新生成的文件，

如下所示：

```python
@app.route('/thumbnails/<filename>')
def serve_thumbnail(filename):
    # Generate thumbnail and save to static directory
    thumbnail_path = generate_thumbnail(filename)
    # Send the thumbnail to the client
    return send_static_file(thumbnail_path)
```

在上面的代码中，我们首先生成缩略图并将其保存到静态目录中，然后使用 send_static_file() 方法来发送新生成的文件。

3. 控制文件发送：

send_static_file()方法还提供了更多的控制选项，例如设置文件的MIME类型、缓存控制头和响应代码。这些选项可以帮助我们更好地控制静态文件的发送过程，

例如：

```python
@app.route('/static/<path:filename>')
def serve_static(filename):
    return send_static_file(filename,
                            mimetype='application/octet-stream',
                            cache_timeout=3600,
                            conditional=True)
```

在上面的代码中，我们设置了文件的 MIME 类型为application/octet-stream，缓存超时时间为 3600 秒，并启用了条件请求，以便在客户端缓存未过期的情况下返回 304 Not Modified 响应。

4. 安全性：

使用 send_static_file() 方法发送静态文件可以提高应用程序的安全性。如果直接从文件系统中发送文件，那么攻击者可能会通过请求URL中包含../来尝试访问应用程序以外的目录，从而获取敏感信息或执行恶意代码。而使用 send_static_file() 方法，则可以确保文件只从静态目录中发送，从而避免了这种攻击。

5. 发送模板文件：

除了发送静态文件，send_static_file()方法还可以用于发送模板文件，例如帮助文档、用户协议等。在这种情况下，我们可以将模板文件放在静态目录中，并使用 send_static_file() 方法来发送它们，

如下所示：

```python
@app.route('/help')
def serve_help():
    return send_static_file('help.html')
```

在上面的代码中，我们将help.html模板文件放在静态目录中，并使用send_static_file()方法来发送它。

## 模板
使用 `Jinja2` 渲染模板,可以将变量注入到 HTML 中以生成最终网页。

在模板内部可以像使用 `url_for()` 和 `get_flashed_messages()` 函数一样访问 `config` 、 `request` 、 `session` 和 `g` 对象。

### 普通模板的使用

#### `render_template` 使用模板文件
```
def render_template(
    template_name_or_list: str | Template | list[str | Template],
    **context: t.Any,
)
```

`render_template` 方法的第一个参数确实是一个名为 `template_name_or_list` 的可选参数，可以是一个字符串、一个 `Template` 对象或一个字符串列表。

如果 `template_name_or_list` 是一个字符串，它将被解释为要渲染的模板文件名。如果 `template_name_or_list` 是一个 `Template` 对象，它将被直接渲染。如果 `template_name_or_list` 是一个字符串列表，Flask 将会尝试按顺序渲染列表中的每个模板文件，直到找到存在的模板文件。

`context`: 为需要传递的关键字参数。

Flask 会在 templates 文件夹内寻找模板，但是这个目录并不是固定的，可以根据需要修改为自定义的目录。

如果传递了模板名，但是没有找到相应的文件，会引发异常 `TemplateNotFound `

当使用 `render_template()` 时，扩展名为 .html 、 .htm 、 .xml 和 .xhtml 的模板中开启自动转义。

自动转义 HTML 模板中的任何数据。即渲染用户的输入是安全的。 任何用户输入的可能出现歧意的字符，如 < 和 > ，会被 转义 ，替换为 安全 的值。这些值在浏览器中看起来一样，但是没有副作用。

`hello.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p> hello {{ name }} </p>
</body>
</html>
```

```python
from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/hello')
@app.route('/hello/<name>')
def hello(name='world'):
    return render_template('hello.html', name=name)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
```

访问 `/hello` 看到 `hello world `

调用了 `render_template()` 方法来渲染模板。方法的第一个参数 `hello.html` 指向你想渲染的模板名称，第二个参数 `name` 是你要传到模板去的变量，变量可以传多个。

#### `render_template_string` 使用模板字串
这个返回看似和直接返回字符串一样，但区别在于可以接收变量，也就是会被渲染后再输出。底层的实现是将字符串转为一个 `jinja` 对象然后携带参数交由 `render_template` 同底层的`_render`方法完整最终渲染。

```python
template_str = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p> hello {{ name }} </p>
</body>
</html>
"""


@app.route('/hello')
@app.route('/hello/<name>')
def hello(name='world'):
    return render_template_string(template_str, name=name)
```

#### 流模板
[#流内容-流模板](#流内容-流模板)

### jinja2 模板语法

在Jinja模板中，内容使用一组特殊的标记来定义，这些标记可以被Jinja模板引擎解析和渲染为最终的输出。以下是Jinja模板中的几种常用标记：

    变量标记：使用{{ }}标记来包含变量，例如：{{ name }}，其中“name”是一个变量。

    控制结构标记：使用{% %}标记来定义控制结构，例如：{% if condition %}…{% endif %}，其中“condition”是一个逻辑表达式。

    过滤器标记：使用管道符号（|）来应用过滤器，例如：{{ name|capitalize }}，其中“capitalize”是一个过滤器。

    注释标记：使用{# #}标记来包含注释，例如：{# This is a comment #}。

    块标记：使用{% %}标记来定义块，例如：{% block content %}…{% endblock %}，其中“content”是块的名称。


也就是默认是使用 `{}`定义。但在某些情况下，如使用了 `vue` 框架，就会产生冲突，可以在配置里面更改为其他的符号。在最后面再详细介绍这部分内容。

### 变量
在Flask中，可以向模板传递各种类型的参数，包括：

    1. 字符串：可以将字符串传递给模板

    2. 列表和元组：可以将列表和元组传递给模板

    3. 字典：可以将字典传递给模板

    4. 函数：可以将函数传递给模板，以便在模板中调用它

    5. 对象(类)：可以将自定义的 Python 对象传递给模板

如果将自定义的 Python 对象传递给模板，可以在模板中使用对象的属性和方法。例如，可以使用点号（.）来访问对象的属性，使用括号来调用对象的方法。但是，需要注意的是，模板中不能直接执行 Python 代码或调用 Python 函数，因为模板是在服务器端渲染的，而不是在客户端执行的。

`hello.html`

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hello</title>
</head>
<body>
    <div>number {{ number_ }}</div>
    <div>string {{ string_ }}</div>
    <div>list {{ list_ }}</div>
    <div>list[0] {{list_[0]}} </div>
    <div>list.pop() {{list_.pop()}} </div>
    <div>tuple {{ tuple_ }}</div>
    <div>dict {{ dict_ }}</div>
    <div>dict.keys() {{ dict_.keys() }}</div>
    <div>dict.values() {{ dict_.values() }}</div>
    <div>func {{func_()}}</div>
    <div>func {{func_}}</div>
    <div>class {{class_}}</div>
    <div>class {{class_()}}</div>
    <div>class {{class_.word}}</div>
</body>
</html>
```

```python
class Word():
    word = "HELLO WORLD"


def hello_():
    return "hello world"


@app.route('/hello')
def hello():
    return render_template(
        'hello.html',
        number_=12,
        string_="test",
        list_=[1, 2],
        tuple_=(1, 2),
        dict_={"ee": 1},
        func_=hello_,
        class_=Word
        )
```

根据上面的例子可以看出，因为 python 中的一切皆对象，列表、元组、字典等数据类型可以使用相应的方法去取值。即使是没有返回的方法、对象，也不会引发异常，会将当前对象的地址输出。不过这通常没有什么意思。模板的作用是渲染，更希望的传入确切的值。这里没有给出使用非传入的方法（如 python 中的 int() dict() 等内置方法）的例子，实际是不可行的，jinja 中并不会将这些内置方法调用，只有传入的对象的方法可以，还有一些全局上下文的flask 方法可以。

### 赋值、字面量
除了使用传递进来的变量，还可以在模板内定义自己的字面量。

赋值使用 set 标签，并且可以为多个变量赋值:

```html
{% set navigation = [('index.html', 'Index'), ('about.html', 'About')] %}
{% set key, value = call_something() %}
```

字面量的类型有：

    1. 字符串
    2. 整数、浮点数
    3. 列表
    4. 元组
    5. 字典
    6. 布尔。true/false

基本与 python 的基本数量类型一致，不同的是 jinja 的布尔使用小写而不是大写。

### 过滤器

Jinja过滤器可以通过管道符号`（|）`来应用到变量上，例如：`{{ variable_name | filter_name }}`。您可以使用多个过滤器来对变量进行连续处理，例如：`{{ variable_name | filter1 | filter2 | filter3 }}`。

常用的Jinja过滤器：

1. safe：将字符串标记为安全，使其不被转义，例如 {{ "<strong>hello</strong>" | safe }}将输出<strong>hello</strong>。

2. capitalize：将字符串的第一个字符转换为大写，例如 `{{ "hello" | capitalize }}` 将输出 Hello。

3. lower：将字符串转换为小写，例如 `{{ "Hello" | lower }}` 将输出hello。

4. upper：将字符串转换为大写，例如 `{{ "hello" | upper }}` 将输出HELLO。

5. title：将字符串中每个单词的首字母转换为大写，例如 `{{ "hello world" | title }}` 将输出 Hello World。

6. replace：将字符串中的一个子串替换为另一个子串，例如 `{{ "hello world" | replace("world", "Jinja") }}` 将输出hello Jinja。

7. truncate：将字符串截断为指定的长度，并添加一个可选的后缀，例如 `{{ "hello world" | truncate(5, "...") }}` 将输出hello...。

8. join：将一个列表中的元素连接起来，例如 `{{ ["hello", "world"] | join(", ") }}` 将输出hello, world。

9. default：如果变量不存在或为空，则返回默认值，例如 `{{ some_variable | default("N/A") }}`。

10. length：返回字符串或列表的长度，例如 `{{ "hello" | length }}` 将输出5，`{{ [1, 2, 3] | length }}` 将输出 3。

11. int：将字符串转换为整数，例如 `{{ "123" | int }}` 将输出123。

12. float：将字符串转换为浮点数，例如 `{{ "3.14" | float }}` 将输出3.14。

13. date：将日期格式化为指定的字符串，例如 `{{ some_date | date("%Y-%m-%d") }}`。


### 自定义过滤器
在现有过滤器不能满足需求的情况下可以自定义额外的过滤器。

通过 `add_template_filter` 或 `template_filter` `app.jinja_env.filters` 方法可注册过滤器。

```python
def my_filter(value, arg1, arg2):
   # 实现自定义过滤器的功能
    return result

app.add_template_filter(my_filter, 'my_filter')
```

```python
@app.template_filter("my_filter")
def my_filter(value, arg1, arg2):
    # 实现自定义过滤器的功能
    return result
```

```python
def my_filter(value, arg1, arg2):
    # 实现自定义过滤器的功能
    return result

app.jinja_env.filters['my_filter'] = my_filter
```

### 运算
#### 算术

`+` ： 加运算。通常对象是数字，但是如果两者是字符串或列表，也可以用这种方式来衔接。
`-` ： 减运算。 
`/` ： 除法。返回值会是一个浮点数。 {{ 1 / 2 }} 等于 {{ 0.5 }} 。
`//`： 整除，对两个数做除法，返回整数商。 {{ 20 // 7 }} 等于 2 。
`%` ： 计算整数除法的余数。 {{ 11 % 7 }} 等于 4 。
`*` ： 乘法。也可以用于重复一个字符串多次。
`**`： 幂运算。

#### 比较

`==` ： 比较两个对象是否相等。
`!=` ： 比较两个对象是否不等。
`> ` ： 如果左边大于右边，返回 true 。
`>=` ： 如果左边大于等于右边，返回 true 。
`< ` ： 如果左边小于右边，返回 true 。
`<=` ： 如果左边小于等于右边，返回 true 。 

#### 逻辑
对于 if 语句，在 for 过滤或 if 表达式中，它可以用于联合多个表达式:

`and   `: 如果左操作数和右操作数同为真，返回 true 。
`or    `: 如果左操作数和右操作数有一个为真，返回 true 。
`not   `: 对一个表达式取反（见下）。
`(expr)`: 表达式组。 

#### 其他
`in` ： 运行序列/映射包含检查。
`is` ： 用于检查 [测试](#测试)
`|`  ： 用于 [过滤器](#过滤器)
`~`  :  把所有的变量转换为字符串，并且拼接。
`()` ： 对于可调用对象进行调用。
`.` `[]` : 获取对象的属性


### 结构控制

#### 遍历
使用 `for` 遍历序列中的每项。

```html
<h1>Members</h1>
<ul>
{% for user in users %}
  <li>{{ user.username|e }}</li>
{% endfor %}
</ul>
```

特殊变量：

|变量             |描述|
|loop.index      |当前循环迭代的次数（从 1 开始）|
|loop.index0     |当前循环迭代的次数（从 0 开始）|
|loop.revindex   |到循环结束需要迭代的次数（从 1 开始）|
|loop.revindex0  |到循环结束需要迭代的次数（从 0 开始）|
|loop.first      |如果是第一次迭代，为 True 。|
|loop.last       |如果是最后一次迭代，为 True 。|
|loop.length     |序列中的项目数。|
|loop.cycle      |在一串序列间期取值的辅助函数。见下面的解释。|

在 for 循环中，可以使用特殊的 `loop.cycle` 辅助函数，伴随循环在一个字符串、变量列表中周期取值:

```html
{% for row in rows %}
    <li class="{{ loop.cycle('odd', 'even') }}">{{ row }}</li>
{% endfor %}
```

从 ` Jinja 2.1` 开始，一个额外的 `cycle` 辅助函数允许循环限定外的周期取值

与 Python 中不同，模板中的循环内不能 break 或 continue 。但可以在迭代 中过滤序列来跳过项目。

下面的例子中跳过了所有隐藏的用户:

```html
{% for user in users if not user.hidden %}
    <li>{{ user.username|e }}</li>
{% endfor %}
```

好处是特殊的 loop 可以正确地计数，从而不计入未迭代过的用户。

如果因序列是空或者过滤移除了序列中的所有项目而没有执行循环，可以使用 else 渲染一个用于替换的块:

```html
<ul>
{% for user in users %}
    <li>{{ user.username|e }}</li>
{% else %}
    <li><em>no users found</em></li>
{% endfor %}
</ul>
```

也可以递归地使用循环。当处理诸如站点地图之类的递归数据时很有用。要递归地使用循环，只需要在循环定义中加上 recursive 修饰，并在你想使用递归的地方，对可迭代量调用 loop 变量。

下面的例子用递归循环实现了站点地图:

```html
<ul class="sitemap">
{%- for item in sitemap recursive %}
    <li><a href="{{ item.href|e }}">{{ item.title }}</a>
    {%- if item.children -%}
        <ul class="submenu">{{ loop(item.children) }}</ul>
    {%- endif %}</li>
{%- endfor %}
</ul>
```

#### 条件判断
Jinja 中的 条件判断和 Python 的语法类似。

 一个变量是否未定义，为空或 false:

```html
{% if users %}
<ul>
{% for user in users %}
    <li>{{ user.username|e }}</li>
{% endfor %}
</ul>
{% endif %}
```

类似的可以用 elif 和 else 来构建多个分支。

```html
{% if kenny.sick %}
    <div>Kenny is sick.</div>
{% elif kenny.dead %}
    <div>You killed Kenny!  You bastard!!!</div>
{% else %}
    <div>Kenny looks okay --- so far</div>
{% endif %}
```

If 也可以被用作 `内联表达式`，即三元运算符。

`<do something> if <something is true> else <do something else>`

#### 测试
判断语句可以与测试语句联合使用。即判断传入数据的类型。

如传入数字判断是否是欧数，传入字符串是否是全大写、是否是字典等。

如例子判断一个数是否是偶数：

```html
{% if num is even %}
    {{ num }} 是偶数。
{% else %}
    {{ num }} 是奇数。
{% endif %}
```

#### 自定义测试

flask 使用 `template_test` 或 `add_template_test` 或 `jinja_env.tests`方法自定义测试的添加。

测试的函数其实就是一个正常的 python 函数，但是第一个值应该为要检查的变量，返回值应该是 True 或 False 

两种方法的例子：检验一个变量是否是素数

```python
import math
from flask import Flask

app = Flask(__name__)

@app.template_test('prime')
def is_prime(n):
    if n == 2:
        return True
    for i in xrange(2, int(math.ceil(math.sqrt(n))) + 1):
        if n % i == 0:
            return False
    return True
```

`template_test` 方法以装饰器的方法进行添加，装饰器内的参数为测试器的名称。

```python
import math
from flask import Flas

app = Flask(__name__)

app.add_template_test('prime',is_prime)


def is_prime(n):
    if n == 2:
        return True
    for i in xrange(2, int(math.ceil(math.sqrt(n))) + 1):
        if n % i == 0:
            return False
    return True
```

同样也可通过 `add_template_test` 方法进行添加，这个方法也是 `template_test` 方法的底层实现。第一个参数为测试器名，第二个参数为函数名。

```python
import math
from flask import Flas

app = Flask(__name__)

def is_prime(n):
    if n == 2:
        return True
    for i in xrange(2, int(math.ceil(math.sqrt(n))) + 1):
        if n % i == 0:
            return False
    return True

app.jinja_env.tests['prime']=is_prime
```

这是最底层的方法，往测试器字典添加新内容。

### 空白控制

### 注释

要把模板中一行的部分注释掉，默认使用 {# ... #} 注释语法。

```html
{# note: disabled template because we no longer use this
    {% for user in users %}
        ...
    {% endfor %}
#}
```

### 转义
有时想要或甚至必要让 Jinja 忽略部分，不会把它作为变量或块来处理。

最简单的方法是在变量分隔符中 `（ {{ ）` 使用变量表达式输出:

```html
{{ '{{' }}
```

对于较大的段落，标记一个块为 raw 是有意义的。例如展示 Jinja 语法的实例， 你可以在模板中用这个片段:

```html
{% raw %}
    <ul>
    {% for item in seq %}
        <li>{{ item }}</li>
    {% endfor %}
    </ul>
{% endraw %}
```

### 模板继承
一般我们的网站虽然页面多，但是很多部分是重用的，比如页首，页脚，导航栏之类的。对于每个页面，都要写这些代码，很麻烦。使用继承可以简化这些模板的书写。

#### 块语句
在Jinja中，块语句是一种特殊的语法结构，它允许定义和重用模板代码块。块语句由两个标记组成： `{% block block_name %}` 和 `{% endblock %}` ，其中 block_name 是块的名称。可以在模板中定义一个或多个块，然后在其他地方重用它们。

块语句的基本语法如下：
```html
{% block block_name %}
    <!-- block content -->
{% endblock %}
```

在上面的示例中，我们定义了一个名为 `block_name` 的块，并指定了块的内容。可以在模板中定义多个块，并为每个块指定唯一的名称。当需要在其他地方重用这些块时，只需使用 `{% extends %}` 语句扩展模板，并在需要插入块的地方使用 `{% block %}` 语句。

例如，下面的示例演示了如何定义一个名为 `base.html` 的基本模板，并在其内部定义一个名为 `content` 的块：

```html
<!DOCTYPE html>
<html>
<head>
    <title>{% block title %} Title {% endblock %}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <header>
        {% block header %}
            <h1>Welcome to my website</h1>
        {% endblock %}
    </header>
    <main>
        {% block content %}
            <p>Default content goes here</p>
        {% endblock %}
    </main>
    <footer>
        {% block footer %}
            <p>Copyright © 2022</p>
        {% endblock %}
    </footer>
</body>
</html>
```

然后，可以创建一个扩展了 `base.html` 的子模板，并重写其中的块：

```html
{% extends "base.html" %}

{% block title %}
    My Custom Title
{% endblock %}

{% block content %}
    <h2>About Us</h2>
    <p>We are a company that specializes in web development.</p>
{% endblock %}
```

在上面的示例中，我们扩展了 `base.html` 模板，并重写了其中的 `title` 和 `content` 块。当我们渲染这个子模板时，Jinja 会自动将子模板中的块插入到父模板中的相应位置，从而生成完整的HTML输出。

最终的输出：

```txt
Welcome to my website
About Us

We are a company that specializes in web development.

Copyright © 2022
```

`Welcome to my website` 是定义在父模板，并且在 `header` 块中，但是在子模板中没有进行重写，原样输出。

`About Us` `We are a company that specializes in web development.` 是子模板中将 `content` 块内容进行了重写，原来的 `Default content goes here` 便被替换掉了。

标题 `My Custom Title` 是子模板将 `title` 块重写了

`Copyright © 2022` 在父模板 `footer` 块中但是子模板没有重写，保持原样

##### 命名块结束标签
Jinja2 允许你在块的结束标签中加入名称来改善可读性:

```html
{% block sidebar %}
    {% block inner_sidebar %}
        ...
    {% endblock inner_sidebar %}
{% endblock sidebar %}
```

但需要注意的是，如果使用命名块结束标签要确保为其块结束标签添加正确的名称。不然会引发 `jinja2.exceptions.TemplateSyntaxError` 异常。

##### super() 使用父模板中的内容
和 python 类的继承一样，除了重写类方法，还可以保留父类的方法属性进行拓展而不是重写。

```html
{% block sidebar %}
    <h3>Table Of Contents</h3>
    ...
    {{ super() }}
{% endblock %}
```

调用 super 来渲染父级块的内容。这会返回父级块的结果。

##### 嵌套块和作用域
嵌套块可以胜任更复杂的布局。而默认的块不允许访问块外作用域中的变量:

```html
{% for item in seq %}
    <li>{% block loop_item %}{{ item }}{% endblock %}</li>
{% endfor %}
```

这个例子会输出空的 `<li>` 项，因为 item 在块中是不可用的。其原因是，如果 块被子模板替换，变量在其块中可能是未定义的或未被传递到上下文。

从 Jinja 2.2 开始，你可以显式地指定在块中可用的变量，只需在块声明中添加 scoped 修饰，就把块设定到作用域中:
```html
{% for item in seq %}
    <li>{% block loop_item scoped %}{{ item }}{% endblock %}</li>
{% endfor %}
```
当覆盖一个块时，不需要提供 scoped 修饰。

#### 使用模板对象

块语句中已经使用到了 `{% extends "base.html" %}`，通常写在文件首行，表示当前模板继承自 `base.html` 模板。

也可以不在首行，不在首行的话 `拓展语句` 之前的内容不会按照父模板的内容渲染，而是相当于在当前模板定义块内容。同时将父模板的内容渲染到 `拓展语句` 的位置。

同时要注意模板名字符串的准确，错误或文件不存在则引发 `jinja2.exceptions.TemplateNotFound`

### 模板包含

`include` 语句用于包含一个模板，并在当前命名空间中返回那个文件的内容渲染结果:

```html
{% include 'header.html' %}
    Body
{% include 'footer.html' %}
```

被包含的模板默认可以访问活动的上下文中的变量。即当前模板接收到的变量等内容在被包含模板也可以正常访问到。

从 `Jinja 2.2` 开始，可以把一句 include 用 ignore missing 标记，这样如果模板不存在，Jinja 会忽略这条语句。当与 `with` 或 `without context` 语句联合使用时，它必须被放在上下文可见性语句之前 。

例 子:

```html
{% include "sidebar.html" ignore missing %}
{% include "sidebar.html" ignore missing with context %}
{% include "sidebar.html" ignore missing without context %}
```

也可以提供一个模板列表，它会在包含前被检查是否存在。第一个存在的模板会被包含进来。如果给出了 `ignore missing` ，且所有这些模板都不存在，则不做任何渲染，否则将会抛出一个异常。

例子:

```html
{% include ['page_detailed.html', 'page.html'] %}
{% include ['special_sidebar.html', 'sidebar.html'] ignore missing %}
```

### 宏
宏类似常规编程语言中的函数。用于把常用行为作为可重用的函数，取代手动重复的工作。

这里是一个宏渲染表单元素的小例子:

```html
{% macro input(name, value='', type='text', size=20) -%}
    <input type="{{ type }}" name="{{ name }}" value="{{
        value|e }}" size="{{ size }}">
{%- endmacro %}
```

在命名空间中，宏之后可以像函数一样调用:

```html
<p>{{ input('username') }}</p>
<p>{{ input('password', type='password') }}</p>
```

如果宏在不同的模板中定义，你需要首先使用 `import` 。

在宏内部，你可以访问三个特殊的变量:

`varargs`:如果有多于宏接受的参数个数的位置参数被传入，它们会作为列表的值保存在 varargs 变量上。
`kwargs` :同 varargs ，但只针对关键字参数。所有未使用的关键字参数会存储在 这个特殊变量中。
`caller` :如果宏通过 call 标签调用，调用者会作为可调用的宏被存储在这个 变量中。

宏也可以暴露某些内部细节。下面的宏对象属性是可用的:

`name         `： 宏的名称。 {{ input.name }} 会打印 input 。
`arguments    `： 一个宏接受的参数名的元组。
`defaults     `： 默认值的元组。
`catch_kwargs `： 如果宏接受额外的关键字参数（也就是访问特殊的 kwargs 变量），为 true 。
`catch_varargs`： 如果宏接受额外的位置参数（也就是访问特殊的 varargs 变量），为 true 。
`caller       `： 如果宏访问特殊的 caller 变量且由 call 标签调用，为 true 。

如果一个宏的名称以下划线开头，则表示它是一个私有宏，它在模板中只能被它所在的模板或者其包含的模板使用，而不能被其他模板引入和使用。

这是因为在Jinja中，以下划线开头的宏、变量、过滤器等都被视为私有的，它们不能被其他模板引入和使用。这是一种约定俗成的写法，用来表示这些宏、变量、过滤器等是内部实现细节，应该避免在外部使用。

#### 导入

有两种方式来导入模板。你可以把整个模板导入到一个变量或从其中导入请求特定的宏 /导出量。

比如我们有一个渲染表单（名为 forms.html ）的助手模块:

```html
{% macro input(name, value='', type='text') -%}
    <input type="{{ type }}" value="{{ value|e }}" name="{{ name }}">
{%- endmacro %}

{%- macro textarea(name, value='', rows=10, cols=40) -%}
    <textarea name="{{ name }}" rows="{{ rows }}" cols="{{ cols
        }}">{{ value|e }}</textarea>
{%- endmacro %}
```

最简单灵活的方式是把整个模块导入为一个变量。这样你可以访问属性:

```html
{% import 'forms.html' as forms %}
<dl>
    <dt>Username</dt>
    <dd>{{ forms.input('username') }}</dd>
    <dt>Password</dt>
    <dd>{{ forms.input('password', type='password') }}</dd>
</dl>
<p>{{ forms.textarea('comment') }}</p>

```

此外你也可以从模板中导入名称到当前的命名空间:

```html
{% from 'forms.html' import input as input_field, textarea %}
<dl>
    <dt>Username</dt>
    <dd>{{ input_field('username') }}</dd>
    <dt>Password</dt>
    <dd>{{ input_field('password', type='password') }}</dd>
</dl>
<p>{{ textarea('comment') }}</p>
```

#### 调用

在某些情况下，需要把一个宏传递到另一个宏。为此，可以使用特殊的 call 块。 

下面的例子展示了如何让宏利用调用功能:
```html
{% macro render_dialog(title, class='dialog') -%}
    <div class="{{ class }}">
        <h2>{{ title }}</h2>
        <div class="contents">
            {{ caller() }}
        </div>
    </div>
{%- endmacro %}

{% call render_dialog('Hello World') %}
    This is a simple dialog rendered by using a macro and
    a call block.
{% endcall %}
```

也可以向调用块传递参数。这在为循环做替换时很有用。总而言之，调用块的工作方 式几乎与宏相同，只是调用块没有名称。

这里是一个带参数的调用块的例子:

```html
{% macro dump_users(users) -%}
    <ul>
    {%- for user in users %}
        <li><p>{{ user.username|e }}</p>{{ caller(user) }}</li>
    {%- endfor %}
    </ul>
{%- endmacro %}

{% call(user) dump_users(list_of_user) %}
    <dl>
        <dl>Realname</dl>
        <dd>{{ user.realname|e }}</dd>
        <dl>Description</dl>
        <dd>{{ user.description }}</dd>
    </dl>
{% endcall %}
```

### 上下文行为
默认下，每个包含的模板会被传递到当前上下文，而导入的模板不会。

也可以显式地更改。通过在 import/include 声明中直接添加 with context 或 without context ，当前的上下文可以传递到模板，而且不会 自动禁用缓存。

这里有两个例子:

```html
{% from 'forms.html' import input with context %}
{% include 'header.html' without context %}
```

### 环境处理器
环境处理器（context processor）是一种 Flask 框架提供的扩展机制，可以在 Flask 应用程序的上下文中注入特定的变量，从而使得这些变量在整个应用程序中都可以访问。通常情况下，Flask 环境处理器被用于注入一些常用的变量，如当前用户、当前时间等，以方便在模板中使用。

Flask 环境处理器的定义是一个函数，该函数必须返回一个字典，其中包含要注入到应用程序上下文中的变量和它们对应的值。

例如，以下是一个简单的 Flask 环境处理器的定义：

```python
@app.context_processor
def inject_user():
    user = get_current_user()
    return dict(current_user=user)
```

在上述示例中，`inject_user` 函数通过调用 `get_current_user()` 函数获取当前用户，并将其注入到应用程序上下文中，并起名为 `current_user`。

应用场景：

Flask 环境处理器通常用于注入一些常用的变量，以方便在模板中使用。

例如，可以使用 Flask 环境处理器注入当前用户、当前时间、应用程序的配置等变量。

这些变量可以在应用程序的任何地方使用，而无需重复编写代码来获取它们。

另外，Flask 环境处理器还可以用于实现一些特定功能，

例如将 Flask-WTF 表单对象注入到模板中，以便在模板中生成表单。

## 消息闪现

介绍之前先看下相关方法的源码：

```python
def flash(message: str, category: str = "message") -> None:
    flashes = session.get("_flashes", [])
    flashes.append((category, message))
    session["_flashes"] = flashes
    app = current_app._get_current_object()  # type: ignore
    message_flashed.send(
        app,
        _async_wrapper=app.ensure_sync,
        message=message,
        category=category,
    )

def get_flashed_messages(
    with_categories: bool = False, category_filter: t.Iterable[str] = ()
) -> list[str] | list[tuple[str, str]]:
    flashes = request_ctx.flashes
    if flashes is None:
        flashes = session.pop("_flashes") if "_flashes" in session else []
        request_ctx.flashes = flashes
    if category_filter:
        flashes = list(filter(lambda f: f[0] in category_filter, flashes))
    if not with_categories:
        return [x[1] for x in flashes]
    return flashes
```

可以清楚看到，消息闪现的实现是利用了 session，在其中设置一个特殊的 key，并且 value 为列表类型，对这个值 key 进行操作。

`flash` 方法用于添加消息，参数 `category` 用于指定消息类型，并无固定值。

```python
@app.route('/')
def index():
    flash('This is a message')
    flash('This is another message', category='error')
    pass
```

这个例子最后的数据结构类型为：`{'_flashes': [('message', 'This is a message'),('error','This is another message')]}`

`get_flashed_messages` 用于获取消息。参数 `with_categories` 指定是否要过滤掉消息类型。设置为 `True` 例子输出的结果为 `[('message', 'This is a message'),('error','This is another message')]`, 即携带消息类型。`category_filter` 参数用于过滤出符合要求的类型。该方法传递给了模板，可以在模板直接调用。

需要注意的是，添加消息可以添加多次，但是获取消息会一次性获取所有的并清除原来的内容。由于是基于 `session` 的， `session` 需要设置 `secret_key` 的值。`get_flashed_messages()` 方法在模板中使用，也可以在视图中使用，模板中使用不用导入，这个方法被当作参数传递给了模板，而在视图中使用需要导入。

应用场景：消息消息闪现是一种在 Flask 应用程序中跨视图传递参数的机制。当用户执行某个操作时，例如提交表单或者登录，应用程序可能需要向用户提供操作结果反馈、成功通知或者错误提示等信息。使用消息闪现，应用程序可以在一个视图中设置一个消息，然后在另一个视图中获取这个消息并将其显示给用户。

TODO: 

这里有个小小的问题。如果是返回模板，消息闪现会被清除。而返回其他类型不会。得到大概靠谱的说法是返回模板以为值这个请求的结束，设置的消息也应在模板中使用了。

例子:

```python
@app.route("/")
def index():
    flash("hello Flask flash")
    return "Hello world"


@app.route("/read")
def read():
    msg = get_flashed_messages()
    return msg
```

该例子在访问 `/`  会设置消息，再次访问 `/read` 会输出消息 `hello Flask flash`

```python
@app.route("/read")
def read():
    msg = get_flashed_messages()
    return msg


@app.route("/test")
def login():
    flash("hello Flask")
    return render_template('index.html')
```

这个例子则在访问 `/test` 后访问 `/read` 得到空值，但奇怪的是使用 `render_template_string` 是可行的。

## 蓝图
蓝图（Blueprint）是一种组织 Flask 应用的方法，它可以将应用的视图函数、静态文件、模板等功能分散到不同的模块中，并通过蓝图注册到应用中，以实现模块化开发和代码复用。在大型 Flask 应用中，使用蓝图可以使代码更加清晰、易于维护和扩展。

下面是 Flask 蓝图的详细介绍：

### 创建蓝图对象

使用 Flask 的 Blueprint 类创建一个蓝图对象，可以通过传入蓝图名称、蓝图所在模块或包的名称等参数来创建：
```python
from flask import Blueprint

bp = Blueprint('my_blueprint', __name__)
```
    
### 注册蓝图

将蓝图注册到 Flask 应用中，使用 Flask 应用对象的 register_blueprint() 方法：

```python
from flask import Flask

app = Flask(__name__)

from my_app.views import bp   # 导入蓝图

app.register_blueprint(bp)   # 注册蓝图
```

### 静态文件和模板

在蓝图中使用静态文件和模板，可以在蓝图所在的包或模块中创建 static 和 templates 文件夹，并在蓝图对象中指定静态文件和模板的路径：

```python
bp = Blueprint('my_blueprint', __name__, static_folder='static', template_folder='templates')
```
    
### URL 前缀

可以为蓝图中的所有路由设置 URL 前缀，以防止路由冲突，使用蓝图对象的 url_prefix 参数：

```python
bp = Blueprint('my_blueprint', __name__, url_prefix='/myapp')
```
    
### 蓝图间的关系

在 Flask 应用中可以使用多个蓝图，蓝图之间也可以存在父子关系，例如：

```python
bp1 = Blueprint('bp1', __name__)
bp2 = Blueprint('bp2', __name__)
bp3 = Blueprint('bp3', __name__)

bp1.register_blueprint(bp2)
bp2.register_blueprint(bp3)
```

在上面的例子中，bp1 是 bp2 的父蓝图，bp2 是 bp3 的父蓝图，bp3 没有子蓝图。父蓝图中的视图函数可以访问子蓝图中的视图函数。

### 创建 URL `url_for`

为当前蓝图的视图创建链接使用 `url_for(".端点名")`，这种方法和 linux 路径的当前相对路径相似。

`url_for('.index')`

也可以跨蓝图生成链接，方式为 `url_for('蓝图名.index')`

`url_for("admin.search")`

### 其他
除了上面介绍的这些方法外，其他的很多如异常处理，钩子方法，路由的添加等 `app` 的方法蓝图都支持，不过生效范围仅限于该蓝图。而应用定义的方法会全局生效。

需要注意的是如果蓝图和主应用定义了相同的路由，最终生效的路由是由查找的顺序决定，优先查找到的路由生效。

## 异常处理
### 错误处理器
使用 `errorhandler()` 装饰函数来注册或者稍后使用 `register_error_handler()` 来注册

使用 `@app.errorhandler` 装饰器来注册错误处理器，处理应用程序中的异常情况。该装饰器可以接受一个异常类或错误状态码作为参数，以便捕获特定类型的异常。

当异常抛出时，Flask 将根据异常类型或状态码查找相应的错误处理器，并调用它来处理异常。如果找不到对应的处理器，则 Flask 将返回默认的错误响应。

以下是使用异常类或错误状态码注册错误处理器的例子：

```python
from flask import Flask, jsonify

app = Flask(__name__)

class MyException(Exception):
    pass

@app.errorhandler(MyException)
def handle_my_exception(error):
    response = jsonify({'error': str(error)})
    response.status_code = 400
    return response

@app.errorhandler(404)
def handle_not_found(error):
    response = jsonify({'error': 'Not found'})
    response.status_code = 404
    return response
```

在这个例子中，我们定义了一个名为 `MyException` 的异常类，并使用 `@app.errorhandler` 装饰器将其注册到应用程序中。我们还定义了一个处理器 `handle_my_exception` 来处理该异常类型，并返回一个自定义的响应。该处理器将抛出的异常对象作为参数，并返回一个 JSON 格式的响应，其中包含一个 error 键和异常消息。我们还将状态码设置为 400。

另外，我们还使用 `@app.errorhandler` 装饰器注册了一个处理器 `handle_not_found`，它捕获 `HTTP 404` 错误并返回一个自定义的响应。该处理器没有参数，并返回一个 JSON 格式的响应，其中包含一个 error 键和值 'Not found'，并将状态码设置为 404。

注意，你可以同时注册多个处理器来处理不同类型的异常或错误状态码。当异常抛出时，Flask 将首先查找对应的异常处理器，如果找不到，则查找对应的状态码处理器。如果仍然找不到，则 Flask 将返回默认的错误响应。


## 中间件
在请求处理过程中实现公共逻辑,如记录日志、身份验证等。

### 日志
Flask 使用标准 Python logging 。所有与 Flask 相关的消息都用 app.logger 来记录.
## 扩展
### 扩展使用
### 扩展开发

## 部署

## 优化
1. 生成器和流

生成器可以产生大量数据而不加载入内存,配合 `Response(stream_with_context())` 可以作为响应体返回, 逐步生成内容。这减少内存使用,避免数据全部载入内存导致内存过高。
    
可以用于:

- 大量数据渲染:在视图中定义生成器函数,`yield` 数据,返回 `Response(stream_with_context` (生成器函数))
- 大文件读取:`yield` 文件块,返回响应

2. 缓存

使用 `Flask-Cache` 可以缓存数据,避免重复计算。

可以缓存:

- 数据库查询结果: 缓存查询结果,下次直接从缓存取
- 模板渲染结果: 缓存渲染后的 HTML 字符串
- 其它耗时计算结果

3. 异步

Flask 支持异步视图和装饰器,可以使用异步数据库操作,网络请求等。

可以使用:

- asyncio: Python 标准库中的异步框架
- gevent: 基于协程的异步框架异步可以大大提高并发性能,避免阻塞。

4. 部署

- uWSGI + Nginx: 生产环境部署,可以处理高并发,稳定
- Gunicorn: WSGI server,比 Flask 自带的 server 性能更好

5. 数据库优化

- 索引:加索引可以加速查询
- EXPLAIN:分析查询计划,寻找优化空间
- 设计:使用缓存,关系数据库等设计数据库

6. 静态文件

让 web 服务器如 Nginx 直接服务静态文件,不经过 Flask。减少 Flask 的请求压力。

7. Flask 配置

- DEBUG 模式会影响性能,生产环境应关闭
- SQLALCHEMY_ECHO: 关闭 SQLAlchemy SQL 输出也可以稍微提高性能
- 其它选项: 了解每个选项的作用,设置适合的性能和调试需求的值

8. 代码优化

- 避免重复查询数据库中的数据,可以存入缓存
- 使用高效的算法和数据结构
- 分解复杂的函数,避免函数过长
- 采用模块化设计,使代码易维护和扩展

9. 自动重启

- 使用 `supervisor` 可以监控 Flask 进程,在 occur 异常退出时自动重启
- 这样可以避免Flask进程意外退出导致服务中断的情况

10. 前端优化

- 快速的前端也可以提高用户体验,减少服务器压力
- 可以使用CDN加速静态资源加载
- 采用模块化设计,避免加载大量不必要的包和资源

11. CDN

- CDN可以缓存静态资源,加速其访问速度
- 可以使用第三方CDN服务,也可以自己搭建私有CDN
- 这可以减少服务器的请求压力,提高用户体验

12. 进程和线程池

- 可以使用 `multiprocessing` 的 Pool 或 `concurrent.futures` 的 `ThreadPoolExecutor` 池化进程或线程,处理更高并发的任务。

13. 性能分析和瓶颈查找

- 可以使用工具如Locust做压力测试,找出性能瓶颈
- 分析数据库慢日志或查询计划,优化查询
- 定期复盘并查找可以优化的地方,逐步提高系统性能
