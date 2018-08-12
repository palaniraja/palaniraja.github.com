---
title: 'Pure Reader for Chrome'
date: 2010-12-06T01:46:00.000-08:00
draft: false
tags : [userscript, My Software Toolbox, chrome, google reader, Tips]
---

I love the theme of the Pure Reader for Safari ([http://nadesign.net/safari/](http://nadesign.net/safari/)). I've ported the CSS as a userscript to use it with Google Chrome. Firefox need some css modification pls find the [css here](http://idzr.org/c5br).  
  
[http://userscripts-mirror.org/scripts/show/92064](http://userscripts-mirror.org/scripts/show/92064)  
  

[![](/assets/Screen-shot-2010-12-06-at-2.33.04-PM.png)](/assets/Screen-shot-2010-12-06-at-2.33.04-PM.png)


**Update:** Links updated with userscripts-mirror.org. Installed 2,059 times. 

```
// ==UserScript==
// @name        Pure Reader 
// @description Pure Reader ported for Chrome, original author http://nadesign.net/safari/
// @include     https://*.google.com/reader/view/*
// @include     http://*.google.com/reader/view/*
// @include     htt*://*.google.*/reader/view*
// @author      Palaniraja 
// ==/UserScript==


var cssNode = document.createElement('link');
cssNode.type = 'text/css';
cssNode.rel = 'stylesheet';
cssNode.href = 'http://idzr.org/c5br';
cssNode.media = 'screen';
cssNode.title = 'dynamicLoadedSheet';
document.getElementsByTagName("head")[0].appendChild(cssNode);
```