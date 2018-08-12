---
title: 'My first Greasemonkey script'
date: Mon, 11 Jun 2007 14:00:26 +0000
draft: false
tags: [javascript, Mozilla]
---
Ok. My first Greasemonkey script is available from [userscripts.org](http://userscripts.org/) ([http://userscripts-mirror.org/scripts/show/9740](http://userscripts-mirror.org/scripts/show/9740)) 

I have been using Greasemonkey for more than a year. Recently I downloaded 2 userscript, GMail superclean and Gmail air, which inspired me to write a script. 

Two days ago, I was assigned to do url rewriting for our free-classifieds site.  As usual I started googling and found a good site with online tools for url rewriting ([seochat.com](http://seochat.com/)), but the advertisement on the site annoyed me, since I was working with long urls. So, I created this script. Hope you will find this useful. It certainly helped me :)


**Update**: Replaced userscripts link with [http://userscripts-mirror.org](http://userscripts-mirror.org).  Installed 328 times. 


```
/*

Remove Banner on seochat.com & devshed.com
Version 0.2b
(C) 2007  
Use this freely under the GNU GPL, http://www.gnu.org/licenses/gpl.html

*/

// ==UserScript==
// @name          seochat.com/devshed banner killer
// @description   Removes the ad banner on the right hand side of the seochat.com & devshed.com
// @include       http://seochat.com/*
// @include       http://www.seochat.com/*
// @include       http://devshed.com/*
// @include       http://www.devshed.com/*
// ==/UserScript==
//*[@id="resultright"]

var resultright = document.getElementById('resultright');
if(resultright) {
 resultright.parentNode.removeChild(resultright);
}
```