---
title: 'Snow Leopard (Retail) on Lenovo 3000 N100'
date: 2010-07-13T11:18:00.001-07:00
draft: false
tags : [experience, ideas, My Software Toolbox, Fun, Snow Leopard, Apple, OSX86, Hacintosh, info, solution, Tips]
---

[![lenovo](/assets/lenovo_thumb.jpg "lenovo")](/assets/lenovo_thumb.jpg)

**Disclaimer:** _There is no alternative to real Mac, if you like Mac go and buy it. If buying a real Mac is too much, you can at least buy a license for Mac OS X Snow Leopard which costs $29 only. This post is to test the Snow Leopard compatibility with Lenovo 3000 N100._

After some hard work I have successfully installed Snow Leopard on a Lenovo 3000 N100 (0768-BVG) model.

### Lenovo 3000 N100 Hardware info

<table width="552" cellspacing="5" cellpadding="1" border="0"><tbody>
<tr>       <td width="200" valign="top">Computer Type</td>        <td width="350" valign="top">ACPI x86-based PC (Mobile)</td>     </tr>
<tr>       <td width="200" valign="top">CPU Type</td>        <td width="350" valign="top">Intel(R) Core(TM) Duo CPU T2350 @ 1.86GHz</td>     </tr>
<tr>       <td width="200" valign="top">Multiplier x FSB</td>        <td width="350" valign="top">6.0 x 133.0 MHz</td>     </tr>
<tr>       <td width="200" valign="top">Video Adapter</td>        <td width="350" valign="top">Mobile Intel(R) 945GM Express Chipset Family</td>     </tr>
<tr>       <td width="200" valign="top">Audio Adapter</td>        <td width="350" valign="top">Intel 82801GBM ICH7-M - High Definition Audio</td>     </tr>
<tr>       <td width="200" valign="top">Ethernet</td>        <td width="350" valign="top">Realtek 8139C</td>     </tr>
</tbody></table>

### Hackintosh | Snow Leopard

<table width="621" cellspacing="5" cellpadding="1" border="0"><tbody>
<tr>       <td width="200" valign="top">Architecture</td>        <td width="419" valign="top">x86(32-bit)</td>     </tr>
<tr>       <td width="200" valign="top">Graphics</td>        <td width="419" valign="top">Yes</td>     </tr>
<tr>       <td width="200" valign="top">Quartz Extreme / Core Image</td>        <td width="419" valign="top">Yes</td>     </tr>
<tr>       <td width="200" valign="top">Audio</td>        <td width="419" valign="top">Yes (with audio-in)</td>     </tr>
<tr>       <td width="200" valign="top">Ethernet </td>        <td width="419" valign="top">Yes (Inbuilt RTL8139)</td>     </tr>
<tr>       <td width="200" valign="top">iPhone SDK</td>        <td width="419" valign="top">Yes (tested with both 3.2/4.0)</td>     </tr>
<tr>       <td width="200" valign="top">Upgrade</td>        <td width="419" valign="top">Yes running 10.6.4 upgraded from 10.6.3 with combo update</td>     </tr>
</tbody></table>

### Installation Method

There is an awesome post by [Prasys](http://prasys.co.cc/2009/08/installing-snow-leopard-for-osx86/) on installing Snow Leopard on PC with details you must know before trying any Hackintosh installation.

I have installed Snow Leopard retail(10.6.3) from my Hackintosh running 10.5.7. If you want to have dual/tri/quad booting patch your **OSInstall.mpkg** (Google is your friend) to install on MBR partition, else you have to repartition your drive as GUID with the default setup.

Mount/Insert your Snow Leopard DVD and go to **/Volumes/OSX86/System/Installation/Packages** and double click **OSInstall.mpkg** file to install. All you have to do is select the partition you want to install.

Do not forget to uncheck printer drivers. Funny thing is OSX Installation DVD has 4.5G printer drivers :)

Select only "**Essential System Software**" (default) to install, you can install additional language and translation later. Installation will be done in somewhere between 30 minutes and an hour.

Install boot loaders like Chameleon to boot from hard-drive. Please follow Prasys blog for the steps and there are other utilities available eg., ([Multibeast](http://tonymacx86.blogspot.com/2010/04/iboot-multibeast-install-mac-os-x-on.html), [MyHackInstaller](http://osx86.sojugarden.com/2010/06/myhack-installer-1-1-released/))

Boot with **-v** option always or update your **com.apple.Boot.plist** to have verbose boot as default.

GUI boot is not good for any hackintosh build. You end up restarting after seeing spinner for longtime. Verbose mode print the status and you can reboot when you don't see any activity for a minute or so.

Install **BSD.pkg** from **/Volumes/Mac OS X Install DVD/System/Installation/Packages** to solve “_**No Installer packages can be found for this disk**_” whenever you want to verify permission and fix permission from Disk Utility. You need to run the **BSD.pkg** from recently installed Snow Leopard.

Boot with **-v -x -f** flag until you get 1280x800 resolution (It is the max. resolution of Lenovo 3000 N100 )

### Issue #1: Grey screen of death

You end up seeing Grey screen or [kernel panic](http://farm3.static.flickr.com/2446/3876638949_617df0e63a_o.jpg) 

Solution: Boot to single user mode (**-s**) and delete the **AppleIntelIntegratedFramebuffer.kext** and reboot with **-v –f**

### Issue #2: NO GUI and mouse pointer blinks at the top left in verbose boot

No GUI after verbose log. You may notice a cursor(mouse pointer) blink at the top left of the screen.

Solution: Boot to single user mode (**-s**) and delete the **ATIFramebuffer.kext** and reboot with **-v –f**

### Issue #3: UI works only with safemode (-x)

Solution: All you have to do is install **AppleIntelIntegratedFramebuffer.kext** v1.4.20. The default Intel GMA950 kext works but you have to delete the default framebuffer kext with the one mentioned above in-order to work in normal mode.

### Issue #4: Can't able to take screenshot

Command + Shift + 3 doesn't create any screenshot/file on your desktop.

Solution: If so please  install **Essentials.pkg** from **/Volumes/Mac OS X Install DVD/System/Installation/Packages**

### Issue #5: Black/empty screenshot or Preview.app doesn't display the .jpg files

You see this issue when QE/CI are not enabled.

Solution: You need to replace the file mentioned in Issue#3.

#### Check whether Quartz Extreme & Core Image (QE/CI) enabled?

Once you install the above mentioned kext QE/CI should be enabled by default. You can verify the same by following.

**a) Translucent menu bar**

[![Screen shot 2010-07-07 at 10.40.06 AM](/assets/Screen-shot-2010-07-07-at-10.40.06-AM.png "Screen shot 2010-07-07 at 10.40.06 AM")](/assets/Screen-shot-2010-07-07-at-10.40.06-AM.png)

[![Screen shot 2010-07-07 at 10.38.49 AM](/assets/Screen-shot-2010-07-07-at-10.38.49-AM.png "Screen shot 2010-07-07 at 10.38.49 AM")](/assets/Screen-shot-2010-07-07-at-10.38.49-AM.png) 

**b) All default Screensavers should work**

[![Screen shot 2010-07-07 at 10.38.39 AM](/assets/Screen-shot-2010-07-07-at-10.38.39-AM.png "Screen shot 2010-07-07 at 10.38.39 AM")](/assets/Screen-shot-2010-07-07-at-10.38.39-AM.png) 

**c) Ripple effect when you add a widget in dashboard**

[![Screen-shot-2010-07-13-at-9.14.32-PM](/assets/Screen-shot-2010-07-13-at-9.14.32-PM.png "Screen-shot-2010-07-13-at-9.14.32-PM")](/assets/Screen-shot-2010-07-13-at-9.14.32-PM.png)

d) [More ways](http://prasys.co.cc/2009/09/quartz-extreme-and-core-image-in-snow-leopard/) to identify

### Issue #6: Ethernet card not detected or detects very rarely

Though some reports RTL8139 supported natively with IONetworkingFamily.kext v1.9. My case was completely different it wasn't detected in first place. But the hardware is working flawlessly with Leopard 10.5.7 w/ PCGenRTL8139Ethernet.kext and WinXP, Ubuntu natively.

OSX seldom detects my Ethernet card. But failed to work after a reboot.

Solution: Please find the [solution here](http://www.insanelymac.com/forum/index.php?showtopic=224472 ).

**P.S**: If you have an iPhone (jail-broken one) then you can use your iPhone to access internet by an awesome [PDAnet](http://www.junefabrics.com/iphone/index.php) application. You can use your either phone's 3G or your Wi-Fi.

You can also download the [complete kexts](http://www.kexts.com/view/757-lenovo_3000_n100_kexts_for_10.6.4.html) from kexts.com