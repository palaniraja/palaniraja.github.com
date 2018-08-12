---
title: 'Disable networking/internet from command line on a Mac'
date: 2013-04-19T09:18:00.000-07:00
draft: false
tags : [how to, OSX, My Software Toolbox, development, info, command line, commands, Tips]
---

If you want to quickly disable internet/networking to test offline features. Doing it frequently with System preferences GUI is quite a slow workflow.  
  
Here is the command to disable your ethernet quickly.  

> `**sudo ifconfig en0 down**`

to activate it again  

> `**sudo ifconfig en0 up**`

  
If you are connected via wireless you can disable it with  

> `**networksetup -setairportpower en1 off**`

to activate it again, use  

> `**networksetup -setairportpower en1 on**`

  
en0 and en1 are device name, which you can get from running the following command  

> `**networksetup -listallhardwareports**`