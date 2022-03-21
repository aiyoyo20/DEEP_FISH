#### 查找符合要求的文件、目录并删除
1、find / -name “test*” |xargs rm -rf
2、find / -name “test*” -exec rm -rf {} \;
3、rm -rf $(find / -name “test”)












