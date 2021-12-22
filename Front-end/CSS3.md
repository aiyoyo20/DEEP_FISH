外边距重叠/外边距塌陷
块的上外边距(margin-top)和下外边距(margin-bottom)有时合并(折叠)为单个边距，其大小为单个边距的最大值(或如果它们相等，则仅为其中一个)，这种行为称为边距折叠。

注意有设定float和position=absolute的元素不会产生外边距重叠行为。

有三种情况会形成外边距重叠：

同一层相邻元素之间
相邻的两个元素之间的外边距重叠，除非后一个元素加上clear-fix清除浮动。
<style>
p:nth-child(1){
  margin-bottom: 13px;
}
p:nth-child(2){
  margin-top: 87px;
}
</style>

<p>下边界范围会...</p>
<p>...会跟这个元素的上边界范围重叠。</p>
Copy to Clipboard
这个例子如果以为边界会合并的话，理所当然会猜测上下2个元素会合并一个100px的边界范围，但其实会发生边界折叠，只会挑选最大边界范围留下，所以这个例子的边界范围其实是87px。

没有内容将父元素和后代元素分开
    如果没有边框border，内边距padding，行内内容，也没有创建块级格式上下文或清除浮动来分开一个块级元素的上边界margin-top 与其内一个或多个后代块级元素的上边界margin-top；或没有边框，内边距，行内内容，高度height，最小高度min-height或 最大高度max-height 来分开一个块级元素的下边界margin-bottom与其内的一个或多个后代后代块元素的下边界margin-bottom，则就会出现父块元素和其内后代块元素外边界重叠，重叠部分最终会溢出到父级块元素外面。
<style type="text/css">
    section    {
        margin-top: 13px;
        margin-bottom: 87px;
    }

    header {
        margin-top: 87px;
    }

    footer {
        margin-bottom: 13px;
    }
</style>

<section>
    <header>上边界重叠 87</header>
    <main></main>
    <footer>下边界重叠 87 不能再高了</footer>
</section>
Copy to Clipboard
空的块级元素
当一个块元素上边界margin-top 直接贴到元素下边界margin-bottom时也会发生边界折叠。这种情况会发生在一个块元素完全没有设定边框border、内边距padding、高度height、最小高度min-height 、最大高度max-height 、内容设定为inline或是加上clear-fix的时候。
<style>
​​​​​​p {
  margin: 0;
}
div {
  margin-top: 13px;
  margin-bottom: 87px;
}
</style>

<p>上边界范围是 87 ...</p>
<div></div>
<p>... 上边界范围是 87</p>
Copy to Clipboard
一些需要注意的地方：

上述情况的组合会产生更复杂的外边距折叠。
即使某一外边距为0，这些规则仍然适用。因此就算父元素的外边距是0，第一个或最后一个子元素的外边距仍然会“溢出”到父元素的外面。
如果参与折叠的外边距中包含负值，折叠后的外边距的值为最大的正边距与最小的负边距（即绝对值最大的负边距）的和,；也就是说如果有-13px 8px 100px叠在一起，边界范围的技术就是 100px -13px的87px。
如果所有参与折叠的外边距都为负，折叠后的外边距的值为最小的负边距的值。这一规则适用于相邻元素和嵌套元素。
以上这些内容都是发生在Block-Level的元素，设定floating和absolutely positioned的元素完全不用担心边界重叠的问题。

https://developer.mozilla.org/zh-CN/docs/Web/CSS/CSS_Box_Model/Mastering_margin_collapsing
