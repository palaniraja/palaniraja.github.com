---
title: 'How to run any iPad (iOS) applications in Kiosk mode'
date: 2014-06-22T04:55:00.000-07:00
draft: false
tags : [Kiosk, iOS, iPad, Guided Access, application, MDM]
---

This is the one feature I know since the release but never bothered to try. Recently I had to provide the steps for a client on how to setup. After trying [multiple](http://www.zchristopoulos.com/2012/02/how-to-disable-ipad-home-button-kioskstore-demo-mode/) [methods](http://stackoverflow.com/questions/15068318/how-to-enable-a-kiosk-mode-programmatically-in-ipad) without any [success](http://stackoverflow.com/questions/22500036/guided-access-kiosk-mode-of-ipad?lq=1), I figured out the steps.

Find the steps to follow below to run iPad application in kiosk mode.

*   Goto Settings -> General -> Accessibility -> Guided Access
*   Set Guided Access ON
*   Set a Passcode, so you an end Guided Access anytime you want.
*   Also Set Accessibility Shortcut ON
*   Exit settings
*   Launch the app you want run in kiosk mode
*   Triple click the home button to show the kiosk/guided access mode options.
*   Tap Start at the top to let iOS run your app in kiosk mode

To end, you need to triple click the home button and tap End button at the top right.

Refer steps with screenshots here: [http://www.webascender.com/Blog/ID/447/How-to-Setup-Kiosk-Mode-Lock-Your-iPad-to-Just-One-App](http://www.webascender.com/Blog/ID/447/How-to-Setup-Kiosk-Mode-Lock-Your-iPad-to-Just-One-App)