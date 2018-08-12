---
title: 'Clean yahoo webmail without Ad''s'
date: Tue, 10 Jul 2007 12:14:30 +0000
draft: false
tags: [javascript, Mozilla, tools]
---

Today, I have uploaded my second Greasemonkey scripts to [userscripts](http://userscripts.org "http://userscripts.org"), [Yahoo webmail++](http://userscripts-mirror.org/scripts/show/10590 "http://userscripts.org/scripts/show/10590") . This will remove (hide) the advertisements in your yahoo webmail, the one at the top and the small ads on the left side. Initially I was trying to do something similar to Gmail Airskin, but unfortunately yahoo uses lot of tables, which I find difficult to finish the script, at this stage it will remove only the advertisements and I will try to update the script soon.

Installed 2,920 times.


```
/*

Remove Banner on yahoo webmail
Version 0.4b
(C) 2007 Palaniraja
Use this freely under the GNU GPL, http://www.gnu.org/licenses/gpl.html

*/
// ==UserScript==
// @name           Yahoo webmail++
// @namespace      https://userscripts-mirror.org
// @description    An extended yahoo webmail  without ads
// @author         Palaniraja
// @homepage       https://userscripts-mirror.org
// @include        http://*.*.mail.yahoo.*/ym/*
// ==/UserScript==

var css = "@namespace url(http://www.w3.org/1999/xhtml); .ad_slug_table, #nwad, #swads, #northbanner{ display:none; } body * { font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px;} div.msgbody *{font-family:inherit; font-size:inherit;}";

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
/*
//will remove the advertisement, but I am not certain to use this xpath only to remove the ad
var rhsAd = document.evaluate('/html/body/table/tbody/tr/td[3]/table/tbody/tr/td[3]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
if(rhsAd)  {
        rhsAd.parentNode.removeChild(rhsAd);
}
*/
```


