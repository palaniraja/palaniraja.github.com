---
title: 'My Userscripts'
date: 2010-12-06T01:46:00.000-08:00
draft: false
tags : [userscript, source, code]
---

Finally decided to copy all my published userscripts.org codes here. 

![all userscripts](/assets/userscript-all.png)

### AnchorFree banner killer

Remove Banner from the top when you use Anchor Free Hotspot shield / Please deactivate the script after disconnecting Hotspot shield


[AnchorFree banner killer](http://userscripts-mirror.org/scripts/show/11070). Installed 6,931 times. 


```
/*

Remove Banner from the top when you use Anchor Free Hotspot shield

Version 0.1
(C) 2007 Palaniraja
Use this freely under the GNU GPL, http://www.gnu.org/licenses/gpl.html
*/

// ==UserScript==
// @name          AnchorFree banner killer
// @description   Remove Banner from the top when you use Anchor Free Hotspot shield / Please deactivate the script after disconnecting Hotspot shield
// @include       *
// ==/UserScript==
//*[@id="resultright"]

var css = "@namespace url(http://www.w3.org/1999/xhtml); html {margin-top:0px} body{margin-top:-90px;}";

if (typeof GM_addStyle != "undefined") {
    GM_addStyle(css);
} else if (typeof addStyle != "undefined") {
    addStyle(css);
} else {
    var heads = document.getElementsByTagName("head");
    //console.log("printing heads",heads);
    if (heads.length > 0) {
        var node = document.createElement("style");
        node.type = "text/css";
        node.innerHTML = css;
        heads[0].appendChild(node); 
        
    }
}

var topBar = document.getElementById('iframe-af-container');
if(topBar) {
 topBar.parentNode.removeChild(topBar);
}

/*document.getElementById('body-af-container').style.position='absolute';
document.getElementById('body-af-container').style.top='0px';
document.getElementById('body-af-container').style.left='0px';*/
//document.getElementById('body-af-container').style.marginTop='-90px';
```

### Yahoo webmail++

[Clean yahoo webmail without Ad's]({{< ref "clean-yahoo-webmail-without-ads.md" >}})


### Pure Reader for Chrome

[Pure reader for Chrome]({{< ref "pure-reader-for-chrome.md" >}})

### SEOchat/Devshed banner killer

[My first Greasemonkey script]({{< ref "my-first-greasemonkey-script.md" >}})
