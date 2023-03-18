### linter：

[luacheck](https://github.com/mpeterv/luacheck) 

lua 的静态分析器和 linter。

 Luacheck 检测各种问题，例如使用未定义的全局变量、未使用的变量和值、访问未初始化的变量、无法访问的代码等等。 检查的大部分方面都是可配置的：有用于定义自定义项目相关全局变量的选项，用于选择一组标准全局变量（Lua 标准库的版本），用于按相关变量的类型和名称过滤警告等。可以使用这些选项在命令行上，将其作为 Lua 注释放入配置或直接放入选中的文件中。

Luacheck 支持使用 Lua 5.1、Lua 5.2、Lua 5.3 和 LuaJIT 语法检查 Lua 文件。 Luacheck 本身是用 Lua 编写的，可以在所有提到的 Lua 版本上运行。

### ### fixer：

[lua-format](https://github.com/Koihik/LuaFormatter)
Code formatter for Lua
