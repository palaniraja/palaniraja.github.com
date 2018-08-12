---
title: 'Nobody is using NOSCRIPT tag?'
date: 2010-03-14T21:13:00.001-07:00
draft: false
tags : [Google, Bug, info, Tips]
---

It seems nobody is using NOSCRIPT tag. I never used in my application as well. But it is surprising that even Google itself ignoring the NOSCRIPT.


![disabling javascript](/assets/ga-nojs1.jpg)

![after disabling javascript](/assets/ga-nojs2.jpg)

The first screen allow the user to navigate to the dashboard of analytics. But the latter on does not provide any clue on what is happening? If there a NOSCRIPT with “Please enable javascript in your browser” could help the user instead of useless `Loading page..` in this case.

I was recently testing a server-side validation without javascript. I forgot to enable the js again and it costs me 10 min and this post. So team kindly include NOSCRIPT in you header please.
