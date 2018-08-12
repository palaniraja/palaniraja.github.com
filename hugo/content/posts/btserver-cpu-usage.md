---
title: 'BTServer CPU Usage'
date: 2011-11-19T09:40:00.001-08:00
draft: false
tags : [xcode, Bug, issues, performance, info, solution, experience, iOS, Apple, battery issues, btserver, Tips]
---

I recently uninstalled all previous versions of xcode (I had all xcode from ios 3.2.x) to install 4.2 on my MBP. Although I freed around 30 GB, noticed an issue shortly. A process named **BTServer** is utilizing high CPU usage.  
  

![](/assets/btserver.jpg)

  
  
As quick search found that BTserver is a bluetooth service, I don't switch ON bluetooth service and the process seems to steal complete CPU cycles whenever the system is waking up from sleep.  
  
Initially I was not able to correlate this with xcode as neither xcode nor simulator was running.  
Closer studies on process hints as it is part of xcode framework. And here is the solution to fix this issue.  
  

> Find **`com.apple.BTServer.plist`** in your xcode installation path typically `/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.0.sdk/System/Library/LaunchDaemons/` and change the value for key **`Disabled`** to `TRUE` from `FALSE`

  

![](/assets/Screen-shot-2011-11-19-at-11.57.14-AM.png)

  
  
It seems to solve the problem for me now. But I have not tested with Apple bluetooth keyboard and mouse.