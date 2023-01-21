### 需求：有一个文件在两个月之前删除了，但是现在想看看里面的内容

`git log --diff-filter = D --summary | grep删除| grep MyFile` 找出删除该文件的操作日志

`git log --all fileDir` 查看所有的提交记录，找到最后的

`git show fileSha --fileDir` 显示文件的最后一个版本


### 查看文件的某一次、版本
如果要看的是某一次版本，上面的就不用第一步，直接第二第三就可以了
