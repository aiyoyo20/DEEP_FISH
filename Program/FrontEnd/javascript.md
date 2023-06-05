### js 中 var、let 和 const 声明变量 的方式区别说明并举例

1、var 声明的变量是函数作用域或全局作用域的，而不是块级作用域的。这意味着在使用 var 声明的变量在其声明的函数内部都是可见的，而在函数外部也可以访问到它们。在同一个作用域内，使用 var 声明同名变量是允许的，并且后声明的变量会覆盖先声明的变量。

例如：
```javascript

function example() {
  var x = 10;
  if (true) {
    var x = 20;
    console.log(x); // 输出 20
  }
  console.log(x); // 输出 20
}
```

在上面的例子中，var x 声明了一个变量 x，它是在函数作用域内声明的。在 if 语句块中，又用 var x 声明了一个同名变量 x，这导致原来的变量 x 被覆盖，因此 console.log(x) 的输出结果是 20。

2、let 和 const 声明的变量是块级作用域的。这意味着在使用 let 或 const 声明的变量的作用域内，它们只能在声明之后访问。在同一个作用域内，使用 let 或 const 声明同名变量是不允许的，如果尝试声明同名变量，JavaScript 引擎会抛出一个错误。

例如：
```javascript

function example() {
  let x = 10;
  if (true) {
    let x = 20;
    console.log(x); // 输出 20
  }
  console.log(x); // 输出 10
}
```

在上面的例子中，let x 声明了一个变量 x，它是在块级作用域内声明的。在 if 语句块中，又用 let x 声明了一个同名变量 x，这并不会影响原来的变量 x，因此 console.log(x) 的输出结果是 10。

3、const 的作用与 let 类似，但是使用 const 声明的变量是不可重新赋值的。这意味着在使用 const 声明的变量的作用域内，它们的值不能被修改。如果尝试重新赋值，JavaScript 引擎会抛出一个错误。

例如：
```javascript

function example() {
  const x = 10;
  if (true) {
    const x = 20;
    console.log(x); // 输出 20
  }
  console.log(x); // 输出 10
}
```

在上面的例子中，const x 声明了一个变量 x，它是在块级作用域内声明的。在 if 语句块中，又用 const x 声明了一个同名变量 x，这并不会影响原来的变量 x，因为 const 声明的变量不能被重新赋值，因此 console.log(x) 的输出结果是 10。如果尝试重新赋值 x = 30，则会抛出一个错误。

补充一点，conset 创建的值如何进行加减等操作也是属于重新赋值，也不允许。