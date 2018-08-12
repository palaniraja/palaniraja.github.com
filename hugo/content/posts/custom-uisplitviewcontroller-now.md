---
title: 'Custom UISplitViewController now available on GitHub'
date: 2010-12-05T07:02:00.000-08:00
draft: false
tags : [experience, ideas, open source, iOS, Apple, SplitViewController, iPad, GitHub, solution, Tips]
---

I created this custom UISplitViewController as one of my iPad project required Split view for only one screen. The default UISplitViewController provided by Apple can only be added to UIWindow which means you can't use it with normal UINavigation based project with only one splitview screen.  
  
You can add/remove UINavigationController and UISplitViewController from AppDelegate, but that doesn't help in giving you the smooth pushtoviewcontroller animation or the default navigation stack in order to go forward and backward.  
  

> [https://github.com/palaniraja/cUISplitViewController](https://github.com/palaniraja/cUISplitViewController)

[![](/assets/landscape.png)](/assets/landscape.png)

  

[![](/assets/portrait.png)](/assets/portrait.png)