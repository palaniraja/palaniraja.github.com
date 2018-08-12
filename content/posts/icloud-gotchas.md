---
title: 'iCloud Gotchas'
date: 2011-12-17T23:08:00.000-08:00
draft: false
tags : [core data, gotchas, issues, experience, icloud, iOS, programming, sdk, Apple, ad-hoc, iPhone, Tips]
---

Integrating iCloud with core data was easy when I found [this tutorial](http://goddess-gate.com/dc2/index.php/post/452), but I ran into few issues while implementing and testing it on devices. And here are the steps how I managed to solve it.  


  
### Issue 1:  
  

![Code 
Signing Entitlements file do not match](/assets/Screen-shot-2011-11-21-at-10.55.47-PM.png)

  
```
The entitlements specified in your application’s Code 
Signing Entitlements file do not match those 
specified in your provisioning profile.  
  
  
(0xE8008016).
```
  
If you create a new application Id and enable iCloud then you miss the adventure. It seems enabling iCloud on existing account provide different identifiers for key value store from app identifier.  
  
And editing .entitlements file with Xcode adds some extra identifiers i.e., {APP_IDENFITIER}  
  
Text is an awesome format, don't ruin the beauty with IDE/ plist editors.  
  
Solution to this problem is, copy for key _entitlements_ from your mobile provisioning file and paste the same in place of in your entitlements file.  
  

![appname.mobileprovision](/assets/Screen-shot-2011-11-21-at-10.55.27-PM.png)


![appname.entitlements](/assets/Screen-shot-2011-12-18-at-12.11.52-PM.png)

  

### Issue 2:

  

> 2011-11-21 22:57:35.770 appname\[6338:1c03\] *** -\[NSFileManager URLForUbiquityContainerIdentifier:\]: An error occurred while getting ubiquity container URL: Error Domain=LibrarianErrorDomain Code=11 "The operation couldn’t be completed. (LibrarianErrorDomain error 11 - The requested container identifier is not permitted by the client's com.apple.developer.ubiquity-container-identifiers entitlement.)" UserInfo=0x1b14b0 {NSDescription=The requested container identifier is not permitted by the client's com.apple.developer.ubiquity-container-identifiers entitlement.}

  
If you see this issue then your missed to update \[nsfilemanager fileManager URLForUbiquityContainerIdentifier:@"with your valid identifier"\] in your appdelegate  
  

```
NSURL *cloudURL = [fileManager URLForUbiquityContainerIdentifier:@"3JCZ6A8BSY.com.yoursite.appname"];
```

  
#### Other common issues are:
  

*   Forgot to turn on wifi when your device is in airplane mode (It beats me every-time)
*   Forgot to switch to your developer certificate from distribution to developer signing (code signing)