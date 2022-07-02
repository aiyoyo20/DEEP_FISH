## 1.two sum (两数之和)
给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出和为目标值target 的那两个整数，并返回它们的数组下标。

```
# 暴力枚举
def twoSum(nums:list,target:int):
    for i in range(len(nums)):
        for j in range(i+1,len(nums)):
        if nums[i]+nums[j]=target:
            return [i,j]
```

```
# 哈希表
def twoSum(nums:list,target:int):
    nums_dict={nums[i]:i for i in range(len(nums))}
    for j in range(len(nums)):
        complement=target-num[j]
        if complement in nums_dict and j!=i:
            return [nums_dict[comlement],j]
    return []
```

```
# 哈希表优化
# 上面的哈希表方法较第一种好一些，但是也有一些问题，需要提前构造哈希表且匹配的过程中会有自己匹配自己的情况，多余了

def twoSum(nums:list,target:int):
    nums_dict={}
    for i,num in enumerate(nums):
        if target-num in nums_dict:
            return [nums_dict[target-num],i]
        nums_dict[num]=i
    return []
```


