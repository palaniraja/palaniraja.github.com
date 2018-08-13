---
title: 'Dropbox Mac - Deletes files on reinstallation?'
date: 2018-08-09T15:01:00.000+05:30
draft: false
tags : [dropbox, mac, recovery, backup]
---

I uninstalled Dropbox from my work mac before submitting my laptop of reimaging of OS with _corporate junk_ installations.

Since I was sure, I should be able to install it again and download all synced files back on mac, I had deleted before handing over to IT people. So I didn't copy files in `~/Dropbox` to my backup hdd.

Due to conflict in scheduling with IT, I returned with same machine without any installation. So naturally I wanted to install Dropbox and sync the files.

Twist in this tale was, after installing Dropbox again I don't see any files synced. I checked the menu for sync status, and it said `Up to date` but no files in `~/Dropbox`.

With little fear as I didn't backup the files, I quickly signed into Dropbox website and shocked to see there are no files in there.

Fear shifted to full panic, I carefully recounted the steps I had taken from uninstall to re-install. I was certain I had deleted the folder post uninstallation of Dropbox app with `app-cleaner` app.

Quickly checked `Deleted Files` section of `Dropbox` web to see all the files deleted recently. 

![screenshot](/assets/dropbox-deleted-files.png)

After restoring files back from `Deleted Files`, I realized the new re-installation didn't ask for username and password. 

> I suspect, somehow Dropbox keep track of deleted files in mac and re-sync deleted files in Dropbox server on re-installation. 

I don't know for sure who would thought of this as a *feature!* I am pretty certain folks who do not know `Deleted Files` option or forgot to check in time would loose their files.

So moral of the story worth repeating, *Do not trust single backup* in this case just `Dropbox`. 

Any how, I was successfully restored, ~2GB of data and Dropbox synced to the system successfully.

![screenshot](/assets/dropbox-post-recovery-size.png)

![screenshot](/assets/dropbox-post-recovery-sync.png)