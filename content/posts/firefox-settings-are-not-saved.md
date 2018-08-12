---
title: 'Firefox : Settings are not saved'
date: 2010-02-03T19:49:00.001-08:00
draft: false
tags : [Firefox, Tips]
---

I was having an issue recently that none of my settings/preferences were saved in Firefox. It opens the Firefox updated page along with extensions updated page every time I open the browser. The manual override of about:blank is also not reflecting.

Solution is just delete your pref.js from your [profile](http://kb.mozillazine.org/Profile_folder) folder or make sure that it is not read only. Interestingly my pref.js was read only I just deleted it, I believe making it writable will also fix the issue.

Profile folder location(s)

* Windows NT (NT4.x/2000/XP/Vista/7): `"%APPDATA%\\Mozilla\\"  `
* Unix/Linux : `~/.mozilla/`  
* Mac OS X: `~/Library/Mozilla/ or ~/Library/Application Support/`