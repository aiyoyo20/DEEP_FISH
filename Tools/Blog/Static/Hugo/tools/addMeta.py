#!/usr/bin/env python3
# Author: aiyoyo
# create time   : 2023-01-12 22:13:32
# last modified : 2023-01-12 22:13:32

# def getFile(filePath):
#     files = os.listdir(filePath)
#     for fi in files:
#         fi_d = os.path.join(filePath, fi)

#         if os.path.isdir(fi_d):
#             yield from getFile(fi_d)
#         else:
#             fileName = os.path.join(filePath, fi_d)

#             if ".md" in fileName:
#                 yield fileName


from config import ignoreFile, ignoreDir, mainDir
import os
import time


def fileNameSplit(path: str, mainDir) -> str:
    """
    函数参数：
        path ： 文件相对路径
        mainDir: markdown 笔记项目名称
    函数功能： 将文件路径分割，各级文件夹名作为 hugo 的标签（tags）元信息值
    函数输出：
        nameListFilter：标签列表
        __：标签列表组合的字符串
    """
    nameList = path.split("/")
    nameListFilter = nameList[nameList.index(mainDir)+1:]
    return nameListFilter, "[" + ", ".join(nameListFilter) + "]"


def getTime(timeStamp):
    """
    函数参数：
        timeStamp ： 时间戳
    函数功能： 将时间戳转为符合 hugo 需求的元信息格式（data）
    函数输出：
        fileTime：需求格式的元信息（data）值
    """
    timeArray = time.localtime(timeStamp)
    formatTime = time.strftime("%Y-%m-%d %H:%M:%S", timeArray)
    fileTime = "T".join(str(formatTime).split(" ")) + "+08:00"
    return fileTime


def filterDir(ignoreDir: str) -> (str, list):
    """
    函数参数：
        ignoreDir ： 需要忽略的文件夹
    函数功能： 过滤掉不需要或不希望被写入的文件夹
    函数输出：
        path： 文件路径
        nameList： 当前路径下所有文件
    """
    for path, _, nameList in os.walk("Notes"):
        for ignore in ignoreDir:
            if ignore in path:
                break
        else:
            yield (path, nameList)


def filterFile(name: str, file: str) -> bool:
    """
    函数参数：
        name： 文件名
        file： 需要忽略的文件
    函数功能： 过滤掉不需要或不希望被写入的文件
    函数输出： 布尔值
    """
    if ".md" in name and name not in file:
        return True


def getInfo() -> dict:
    """
    函数参数： None
    函数功能： 遍历所有文件夹找出符合要求的文件读取文件的信息并处理
    函数输出：
        fileInfo: 符合要求的文件元信息
    """
    for path, nameList in ignoreDir(ignoreDir):
        fileInfo = {}
        for name in nameList:
            if filterFile(name, ignoreFile):
                filePath = path + "/" + name
                timeStamp = os.path.getmtime(filePath)
                fileInfo["fileName"] = name
                fileInfo["fileTag"] = fileNameSplit(path, mainDir)[1]
                fileInfo["categories"] = fileNameSplit(path, mainDir)[0][0]
                fileInfo["createTime"] = getTime(timeStamp)
                fileInfo["filePath"] = filePath
                yield fileInfo


def makeMeta(info: dict) -> str:
    """
    函数参数：
        info：文件的元信息字典
    函数功能： 元信息组合成长字符串，为写一步添加为元信息头做准备
    函数输出：
        metasStr：元信息头长字符串
    """
    createTime = info["createTime"]
    fileTitle = info["fileName"].replace(".md", "")
    tags = info["fileTag"]
    categories = info["categories"]
    metaStr = '---\ntitle: "{}"\ndate: {}\ntags: {}\ncategories: [{}]\
    n---\n\n'.format(fileTitle, createTime, tags, categories)

    return metaStr


def addMeta(fileName: str, metaStr: str) -> None:
    """
    函数参数：
        fileName： markdown 文件的相对路径
        metaStr： 元信息头长字符串
    函数功能： 文件头部写入元信息
    函数输出： None
    """
    with open(fileName, 'r+') as f:
        content = f.read()
        f.seek(0, 0)
        f.write(metaStr+content)


def main() -> None:
    """
    函数参数： None
    函数功能： __
    函数输出： None
    """
    for info in getInfo():
        filePath = info["filePath"]
        addMeta(filePath, makeMeta(info),)


if __name__ == "__main__":
    main()
