---
title: 'Solving Read-Only Notes.app issue'
date: 2010-06-09T01:12:00.001-07:00
draft: false
tags : [ideas, Fun, Apple, info, solution, commands, iPhone, Tips]
---

Notes.app of miPhone was not allowing me to save any new notes. This was after restoring the [manual backup](http://www.funkyspacemonkey.com/howto-manually-backup-iphone) of notes.db. I have taken the backup of my Address book, notes and images data with [iPhone Explorer](http://www.macroplant.com/iphoneexplorer/).

With the help Terminal app from Cydia I was able to CD to my private dir to check the permission of the files. And I was right, the owner of the file was root instead of mobile. I executed `sudo chown mobile:mobile notes.db` from the directory to solve the issues.

[![Before](/assets/Before.png "Before")](/assets/Before.png)

> after, `sudo chown mobile:mobile notes.db` 

[![After](/assets/After.png "After")](/assets/After.png)