---
title: 'Expired distribution provisioning and Yak shaving'
date: 2013-01-16T00:18:00.000-08:00
draft: false
tags : [Notes, Compatibility, gotchas, xcode, App Store, info, distribution, experience, how to, iOS, Apple, ad-hoc, Best Practices, Tips]
---

Last Thursday one of my iPad app's provisioning file has expired. Client brought it to us at the very late moment, the iPad app was distributed internally as an enterprise app. App users are for [HVAC](http://en.wikipedia.org/wiki/HVAC) technicians, app integrates with their organization's CRM ([Salesforce](http://login.salesforce.com/)) so distributing it with App store doesn't make any sense.  
  

![](/assets/expired-provision-yak-shaving.png)

  
As immediate action, I tried to renew the provisioning files with iOS developer portal. It does not provide an option for renewing distribution profiles but developer provisioning was given an option to renew. The same goes for trying to renew with xcode organizer.  
  
A quick search on Google and StackOverflow to know what will happen once the provisioning file get expired. After referring few wrong posts I come to the conclusion app will continue to work. Only later I come to know they are wrong (atleast in this case) _#Mistake1_  
  
As per "_Ain't broke don't fix it_" golden rule, I didn't take any action. I thought, Renew button on distribution provision wouldappear once it get expire. The worst case scenario I expected was distributing a new build.  
  
The day comes and provision file expired for all of us at same moment, I had no timezone advantage (UTC knows no mercy). _#Mistake2_  
  
It was hard to come to this conclusion at the time, deleting the provisioning file of a suspended app and removing it from background seems to work. I had to restart the device to confirm. Also later it was showing "_Expires in 0 hour_" and "_Expired 0 hour ago_". There was no minutes so I had to wait like  till the very last minute for testing.  
  

#### Duplicate Keychain

I had paid a price for having very little knowledge about Keychain Access and their certificates. Though I deleted all my developer and distribution certificates under Certificates category, xcode was nagging about the duplicate. _#Mistake3_  
  
I gave up on the idea of providing new build with same AppID and tried a new AppID. No sugar there, stupid xcode and keychain util. Yes I tried the _View->show expired certificates_ too.  
  
Finally I had to find the directory where xcode save the profile and delete manually. Also I have to search for  "" and "" in all _Keychains_ and _Category_ and delete them. Also created a new distribution profile with same app id.  

  

#### Xcode updates and iOS 6 depcrecation of supportedInterfaceOrientations

Every new version of Xcode delete the old or previous iOS SDK as its post installation step. I can understand this from Xcode developer perspective but from an app developer it is a nightmare. My system admin deleted all my previous xcode dmg archive from their NAS drive as it took 40+Gb.

  

I had Xcode 4.5.2 installed on my dev machine and the application was built with iOS SDK 5.1. The Zip archive of xcode.app prior to xcode update didn't help either.

  

Though I was aware, there are issues with interface orientation behaviour in iOS6. Somehow I assumed, it will not be an issue as my deployment target was iOS 5.1. I was wrong again. _#Mistake4_

  

The new build submitted to customer using iPad2 with iOS6 noticied it rightaway, where I was having first gen iPad and no way of identifiying it myself. Theoritcally i could have tested this with iOS 6 simulator but i literally had 0 minutes as technicians were out in the field and find no way to see their tickets, site and asset information. _#mistake5_

  

Not having an upgradeable device hurts a lot, I blame on both my company for not providing me a decent device and Apple for their limitations. 

  

#### TL;DR - Lessons learned

1.  Application will not work once provisioning profile expired. 
2.  Provisioning expiry time is [UTC](http://en.wikipedia.org/wiki/Coordinated_Universal_Time) i.e., No timezone advantage even if you are NZ dev supporting PST customer.
3.  No way you could get a correct answer for Keychain Access and Provisioning file issues. Closed systems and DRM, even after paying large sum for devices and development you can't install app without mothership's cryptic certificates.
4.  XCode upgrades and Deployment targets are not your friends.
5.  iOS 6 Autorotation behaviour is your enemy when you build ios 5.1 target.

Looong story short, I ended up creating a new distribution provisioning file with existing app id. So the technicians need not enter their user id, password and security token again. Also had to fix the the orientation behaviour for iOS 6. 

  

What I initially thought of a [10 min](http://my.safaribooksonline.com/book/software-engineering-and-development/9780596519780/automation/i_sect13_d1e5512) work took like [4 hours overall](http://programmers.stackexchange.com/questions/34775/correct-definition-of-the-term-yak-shaving), timing was so perfect I left office around midnight. And I was morally down with my inability to make a right time estimation even after years of experience.