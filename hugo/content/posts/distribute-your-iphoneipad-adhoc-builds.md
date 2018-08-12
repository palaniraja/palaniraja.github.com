---
title: 'Distribute your iPhone/iPad adhoc builds Over The Air using Dropbox'
date: 2011-06-29T01:18:00.000-07:00
draft: false
tags : [testing, tools, iPad, versioning, info, distribution, beta, experience, ideas, iOS, My Software Toolbox, Apple, testflightapp, ad-hoc, iPhone, iTunes, Tips]
---

> **Update:** I recently found this site called [diawi.com](http://diawi.com/) which allows you to distribute the app similar to file-sharing sites, drag and drop ipa file and share the link to the testers.

  
  
Yes, there is an awesome service by [Testflight App](https://testflightapp.com/) which I highly recommend. Not because I received their [stickers](http://twitpic.com/5ii1e8) for being an early adaptor :). It does so many things which makes distributing app for beta testing a breeze, go try it yourself.  
  
I was just curious to know how OTA works, after testing with own web server for internal testing, I thought why can't I do this with [Dropbox](https://www.dropbox.com/)?  
  
  

*   Build your app from **xcode** using **Build and Archive** option.
*   Upload your **ipa** file to Dropbox. And get public link for the ipa.
*   Download the _**manifest.plist**_ file from [https://gist.github.com/1051160](https://gist.github.com/1051160) and edit the line #14 with the public link of your ipa. Modify other keys as well (bundle-identifier, bundle-version, title)
*   Upload the modified _**manifest.plist**_ to Dropbox and get its public link.
*   Download _**index.html**_ from [https://gist.github.com/1051163](https://gist.github.com/1051163) and edit _**url**_ param at line #8 with public link of your manifest.plist
*   Upload the **_index.html_** to Dropbox and share the public link of it with your beta testers.


![](/assets/upload-ipa.jpg)

Upload your ipa

![](/assets/ipa-public-link.jpg)

Copying public link

  
![](/assets/final-setof-files.jpg)

All files, copying public url for index.html 

  
  
Installing the app  
  

![](/assets/photo-1.png)


![](/assets/photo-2.png)
  
  
App icon will be disappeared once the installation complete (which is weird), but restarting the device does solve the issue. You have your app on springboard for testing. Enjoy delivering your adhoc builds to your testers by distributing over the air.  
  
NO iTunes FTW.