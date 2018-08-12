---
title: 'Hackintosh Guide: Snow Leopard 10.6.1-10.6.2 Intel AMD made by Hazard'
date: 2010-05-17T02:36:00.000-07:00
draft: false
tags : [Snow Leopard, OSX86, Hacintosh, info, solution, Tips]
---

[![sonyvaio](/assets/sonyvaio.jpg "sonyvaio")](/assets/sonyvaio.jpg) 

Last Saturday I was successful in installing Snow Leopard on [Sony Vaio](http://www.sony.co.in/product/vpceb16fg) with Core i3 Processor. I have tried many distro's in past 2 years and I can tell you it is not easy to install on any given PC.  
  
Here is my notes of the installation.  
  
  
### Issue #1: Continuous Reboot  
  
You need to add the bootflag called busratio, in my case it was **busratio=16**. And here is the [link](http://tonymacx86.blogspot.com/2010/01/intel-core-i3i5-dual-core-processors.html) to get busratio for most of Intel Core i processor.  
  
###  Issue #2: Freezes at "Do You Already Own a Mac" screen  
  
I don't know why it freezes but the solution is, you need to skip the registration process and please follow the steps to skip.  

*   Reboot your system
*   Boot into single user mode by providing the boot flag **-v -s busratio=16**
*   Once you are in the terminal (single user mode), mount the / with R/W permission by executing the commands  
    **/sbin/fsck -fy  
    /sbin/mount -uw /**  
    (Note: Do not forget to type **/** (slash) I skip it most of the time :-)
*   Skip the Registration by executing the following command  
    **touch /private/var/db/.AppleSetupDone**

This should skip the Setup process, but it also skips the user registration, so you don't have an account to login when it reboots.  
  
You can create a new user with commands ([link](http://osxdaily.com/2007/10/29/how-to-add-a-user-from-the-os-x-command-line-works-with-leopard/)) alternatively, you can reset the password for the user root and use it to create a new user once login. Execute the following command to reset the password in single user mode.  

*   **launchctl load /System/Library/LaunchDaemons/com.apple.DirectoryServices.plist**
*   **passwd root**

that's pretty much it. Now you should be able to login to Snow Leopard.  
  
**P.S:**  
Network, Sound, USB wasn't working. Moreover all Snow Leopard distro's have a peculiar issue in common, that you can't able to take screen shot **(Command + Shift + 3)** doesn't capture the screen. This exists in SnowLeo, SnowLeo Universal 3.6 iPortable Snowleo distro's as well.  
  
I have also tried to take screenshot from Preview app, it crashes and logs an issue related to coregraphics framework. My colleague told me that he was able to install iPhone SDK 3.1.3 for snow leopard on the same successfully.  
  
**Update**:  
Please refer my post [Snow Leopard (Retail) on Lenovo 3000 N100]({{< ref "snow-leopard-retail-on-lenovo-3000-n100.md" >}}) on how to fix the screen capture and preview.app related issue I mentioned above.