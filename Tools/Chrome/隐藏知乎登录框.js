// ==UserScript==
// @namespace yunyuyuan
// @name 隐藏知乎登录框&链接无缝跳转
// @description 隐藏烦人的知乎登录框，点击链接直接跳转不会提示有风险(谨慎操作)
// @match *://*.zhihu.com/*
// @version 0.0.1.20201202053300
// ==/UserScript==

(function (){
  'use strict';
    const style = document.createElement("style");
    style.innerHTML = "html{overflow: auto !important}.Modal-enter-done{display: none !important}";
    document.head.appendChild(style);
    // link.zhihu.com
    document.addEventListener('click', (e)=>{
      let now = e.target;
      while (now) {
        if (now.tagName.toLowerCase() === 'a' && now.hasAttribute('href')) {
          checkIsZhihuLink(now.getAttribute('href'), e);
        }
        now = now.parentElement;
      }
    })
    const checkIsZhihuLink = (s, e)=> {
      const matcher = s.match(/https?:\/\/link\.zhihu\.com\/?\?target=(.+)$/);
      if (matcher) {
        e.stopPropagation();
        e.preventDefault();
        window.open(decodeURIComponent(matcher[1]));
      }
    }
})()
