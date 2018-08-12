---
title: 'Prj - Times of India epub'
date: 2013-01-16T21:02:00.000-08:00
draft: false
tags : [jquery, ebook reader, Times of India, EPUB, code, GitHub, read it later, development, ereader, Ideavault, E-Daily]
---

  
Remember my [old post about the TOI - Epub project]({{< ref "ereader-friendly-times-of-india.md" >}})? Yesterday, I published the source on github. If anyone still interested, go ahead and take a look at the source. Kindly go through the [Dev-Notes.txt](https://github.com/palaniraja/toi-epub/blob/master/Dev-Notes.txt), as it has all the urls and image path used to inspect their mpaper hiearchy.  
  

#### How does it work

*   It loads the mpaper in an iframe (test.php)
*   Uses jQuery to parse the iframe's html and get the article url.
*   Links of articles are combined as a JSON object
*   JSON dictionary then POST'd to (convert.php) which uses an opensource epub library to create the ebook version.

Github repo for [toi-epub](https://github.com/palaniraja/toi-epub)  
  

![nook e-reader](/assets/IMG_0564.jpg)


![nook e-reader](/assets/IMG_0566.jpg)

