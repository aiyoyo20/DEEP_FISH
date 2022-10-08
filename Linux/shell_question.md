## 数组作为函数参数的问题
`
#!/bin/bash 

urlOne="https://raw.githubusercontent.com/ngosang/trackerslist/master/"
arrayOne=("trackers_all.txt" "trackers_all_http.txt" "trackers_all_https.txt" "trackers_all_ip.txt" "trackers_all_udp.txt" "trackers_all_ws.txt" "trackers_best.txt" "trackers_best_ip.txt")

function getTracker(){
    array=$2
    echo ${array[*]}
    for i in ${array[*]}
    do  
        url="${1}${i}"
        echo "wget $url"
    done
}

getTracker ${urlOne} "${arrayOne[*]}"
`
因为不是只传一个数组，要考虑其他参数的情况，而且数组不一定在最前最后，即尽量不在函数内使用"$@"、"@*" 接收再切片的方式。

1、传参

如果使用@的方式，无论有没有""数组都会被展开，结果就变成了函数接受参数1和数组里面的每个值作为参数，总参数个数就变成了1+数组长度，如果数组有多个值就会影响到脚本的结果了。

不使用""包裹则不管是`@`、`*` 也都会被展开。

只有使用`""` 和 `*` 传递 在函数内才能使用位置参数去接收。

2、函数内部
因为语法限制，无法使用"${${}}"的方式，所以要使用一个变量去接收再使用。

下面的情况有点迷惑了。

直接输出"$2"得到的是一个整体，这个整体按照shell的理念应该是字符串，无论是直接使用变量名、"${name[*]}"、"${name[@]}"都能正确的循环，也就排除了会动态转为数组的可能。

单写了一个测试的，对于不管是""、''包裹的有空格的字符串，for循环都会根据空格去拆分。

于是猜测是不是会自动识别分隔符，更改了`IFS`的值，果然遍历就只输出了一个整体，再对字符串中的某些空格改为新的分隔符，的确是根据分隔符来拆分。

但为了整体的统一，还是在读取循环时也使用"${name[*]}"的方式吧。



## “sudo echo ＞＞”或类似命令串提示权限不够的解决办法
这是因为重定向符号 “>” 和 “>>” 也是 bash 的命令。sudo 只是让 echo 命令具有了 root 权限，但是没有让 “>” 和 “>>” 命令也具有root 权限，所以 bash 会认为这两个命令都没有写入信息的权限。

解决方法一：
利用 “sh -c” 命令，它可以让 bash 将一个字串作为完整的命令来执行，这样就可以将 sudo 的影响范围扩展到整条命令。具体用法如下：
```
sudo sh -c 'command line'
sudo sh -c 'echo "114.250.64.34    translate.googleapis.com" >> /etc/hosts'
```

解决方法二：
利用管道和 tee 命令，该命令可以从标准输入中读入信息并将其写入标准输出或文件中，具体用法如下：
```
echo "strings" | sudo tee -a filename
echo "114.250.64.34    translate.googleapis.com" | sudo tee -a /etc/hosts 
```
