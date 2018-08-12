---
title: 'Installing more simulators for xcode 4.2 without re-downloading everytime'
date: 2011-11-28T03:34:00.001-08:00
draft: false
tags : [simulator, iOS, installation, Apple, xcode, solution, downloads, software engineering, Tips]
---

If you are like me, who use more than one machine to develop iOS app and wants to install 4.x and 3.x simulator without re-downloading it on every machine? then I've got a solution.  
  
This is how I setup my installation - a 2 step process.  
  
1\. Find the .dmg files which is downloaded by XCode 4.2 and download it seperately.  
2\. Spoof your hosts file of the machine to point the files you have downloaded already.  
  
[Direct download link](https://developer.apple.com/downloads/download.action?path=Developer_Tools/ios_simulator/iphone_4.3_iphonesimulatorsdk4_3.dmg) for 4.3  
[Direct download link](https://developer.apple.com/downloads/download.action?path=Developer_Tools/ios_simulator/iphone_3_iphonesdk3x.dmg) for 3.x  
  
### Step 1:  
  
By inspecting the console.app I was able to figure out the URL of .dmg xcode trying to download.  
  
Eg. The path for 4x simulator is  
  

> http://adcdownload.apple.com/Developer\_Tools/ios\_simulator/ iphone\_4.3\_iphonesimulatorsdk4_3.dmg

  
  
which resolves into  
  

> https://developer.apple.com/downloads/download.action? path=Developer\_Tools/ios\_simulator/iphone\_4.3\_iphonesimulatorsdk4_3.dmg

  

  

Now, Open the xcode and select more simulators from the menu.

  

click install on any of the available option to keep the session validated against your developer acccount.

  

Once it started to download the file after authentication, just stop it.


![](/assets/sim1.png)

![](/assets/Screen-shot-2011-11-27-at-3.57.02-PM-1.jpg)

![](/assets/Screen-shot-2011-11-27-at-3.57.13-PM.jpg)

![](/assets/Screen-shot-2011-11-27-at-3.57.25-PM-2.jpg)


### Step 2:

  

Place your downloaded .dmg in  

>  <yourhomedir>/Developer\_Tools/ios\_simulator/iphone\_4.3\_iphonesimulatorsdk4_3.dmg

  

Start apache on port 80 and update **`/private/etc/hosts`** to have

  
```
#xcode4.2 legacy simulators dmg proxy  
127.0.0.1 adcdownload.apple.com  
```
  

Switch to xcode and click install again to install the simulator from your local machine without re-downloading.

  

**Note:**

Installing .dmg individually doesn't seem to install properly atleast in my case (While installing xcode, I've used different directory instead of typical /Developer)