---
title: 'Raspbian + XBMC + Airplay'
date: 2013-08-18T05:00:00.000-07:00
draft: false
tags : [experience, how to, Airplay, iOS, Hardware, installation, XBMC, Raspbian, raspberrypi, hacking, info]
categories: [projects]
---

_**TL;DR**_: Yes, you can. If you are only interested in the steps skip to the relevant section.  
  
I own a Raspberry Pi for closer to a year now. I was not able to use my Netgear N150 (WNA1100) dongle until last week with it, I was kind of lost my enthusiasm by this bitter experience and hold my experiments for long time. Other than installing some console emulators and XBMC in last 6 months, I have not done anything with my Raspberry Pi.  You can refer my adventures [here](http://raspberrypi.stackexchange.com/questions/4344/diy-external-powered-usb-hub-not-working) and [here](http://raspberrypi.stackexchange.com/questions/4687/setting-up-netgear-n150-usb-wifi-adapter-with-raspberrypi-wheezy).  
  
Ever since I heard about Pidora (Fedora distribution for rPi); I wanted to try Pidora to check whether it supports my wifi dongle. I also recently learnt that Raspberry team officially announced Berryboot alternative called [NOOBS](http://www.raspberrypi.org/archives/4100) (technically both are not same, I believe with Berryboot you can dual-boot with multiple OS). I got curious and finally took a day off to try.  
  
NOOBS packs 6 OS for rPi. Raspbian, Pidora, Risc OS, RaspXBMC, OpenElec, Arch linux) in a [1.2G zip file](http://www.raspberrypi.org/downloads).  
  
I have tried Arch, Risc and Raspbian in the past, and I was not able make my wifi dongle work with any of them.  
  
Much to my surprise with stock Raspbian disro my WNA1100 got detected and connected to my wifi out of the box; almost zero steps.  
  

#### Steps:

*   Download NOOBS archive and unzip into your SDCard.
*   Reboot to your SD card and select Raspbian from the welcome screen.
*   This should wipe your SDCard and install Raspbian in about ~15 minutes. Not to worry you can still have all the OS available for you to install later.
*   Once Raspbian boots for the first time. Configure  your network (`eth0` or `wlan0`).
*   Do the usual system upgrade by running the following command in terminal.  
    `sudo apt-get update`  
    `sudo apt-get upgrade`
*   Install XBMC by running the command. This should install XBMC and its dependencies
*   `sudo apt-get install XBMC`
*   Install Airplay daemon by executing the command  
    `sudo apt-get install avahi-daemon`
*   Once avahi installed, Enable Airplay in **_XBMC -> system -> services -> Enable Airplay services_**.

That is all to it, once your iDevice and Raspberry are connected to same network you should be able to share photos/Videos/Audio via Airplay from your iDevice to Rasbperry Pi.  
  

#### Other Notes:

*   Instead of _**dd**_-ing the image to SD card, install it directly on rPi. If my memory serves me correctly, my Macbook Pro late 2010 took almost 40-60 min to _**`dd`**_ Raspbian image to the SDCard. Where as installing Raspbian with NOOBS, directly on rPi took only about 15-20 minutes.
*   I couldn't get my wifi configure with hidden SSID.
*   For those who keeps tab: I did try Pidora, it was very slow compared to Raspbian and I was not able to configure my wifi dongle with it.
*   If you are only looking for media center, I would suggest you to try OpenElec distribution from NOOBS. It is noticeably faster compared to XBMC on Raspian and RaspXBMC distro.
*   Keyboard is not functional when XBMC displays onscreen keyboard. The workaround at the moment is to execute XBMC as super user.  `sudo XBMC-standalone`
*   XBMC does not support Airplay mirroring. However there is a new application called [rPlay](http://vmlite.com/index.php?option=com_kunena&func=view&catid=23&id=10991) seems to solve this problem.
*   Not sure if rPlay is a free application. The folks at rPlay are kind enough to share a licence as a beta tester. I have not tested it yet.

#### Why Raspian + XBMC

 Well, I'm a greedy b!@$%!$d, I want to use it as linux machine + media center + airplay receiver + gaming console. So direct boot to OpenElec is not my solution.  
  

#### Other Links

*   If you were not able to install XBMC, you may need to edit your sources list. Refer [this link](http://michael.gorven.za.net/raspberrypi/xbmc).
*   [http://rvalbuena.blogspot.in/2013/05/switching-from-openelec-to-xbmc.html](http://rvalbuena.blogspot.in/2013/05/switching-from-openelec-to-xbmc.html)

  
Since I have checked off this task, now I can buy Apple TV and still be proud that I had configured and played with Raspberry Pi as Apple tv alternative ;-)