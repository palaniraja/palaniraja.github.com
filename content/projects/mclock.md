---
title: Mclock
date: 2012-08-08T14:03:05+05:30
draft: false
order: 1
featured: 1
shortTitle: mclock
feature: true
description: |
    A minimalist native clock application to display secondary time of different timezone of your choice. Allows you complete control over _time format_ and more.
tags: [projects, opensource, mac]
categories: [projects]

---


A minimalist clock to display time of different timezone of your choice. 


Eg.,

* "IST" to have a additional clock in your menubar to display Indian Standard Time
* "EST" for Eastern time
* Or try "UTC+10"

The app stays in menu bar all the time and you can customize the display format and timezone.  Application support native `cmd` drag to reorder and also works with `darkmode`

### Screenshots

![mclock in action](/assets/mclock-in-action.png)

![mclock in action](/assets/mclock-preferences.png)


Source: [https://github.com/palaniraja/mclock](https://github.com/palaniraja/mclock)  
  
Download: [mclock](https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=1076119164&mt=12 "Link to mac appstore") |  [mclock.app (unsigned)](https://github.com/palaniraja/mclock/blob/master/binary/mclock.zip?raw=true)

---


### What's New in v2.2

Features & Bug fixes:

1. Much requested feature to update the time after every second. If you provide second modifier 's' your timer will be updated every second.
2. Fixed: Update time after if system's timezone updated.
3. Fixed: The timer fires only after 60 seconds even if app started in between. Now it is scheduled to update the time as soon as you system time updates.



> Initial blog post: [Minimalistic Clock]({{< ref "mclock-additional-clock-application-for.md" >}})