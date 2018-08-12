---
title: '[BEROR]Code Sign error: Provisioning profile ''579ACFD8-827A-4325-F623-DB8CDD5081DB'' can''t be found'
date: 2010-04-04T09:13:00.001-07:00
draft: false
tags : [Apple, Bug, info, solution, iPhone, Tips]
---

> #### Check dependencies Code Sign error: Provisioning profile
> 
> #### \[BEROR\]Code Sign error: Provisioning profile '579ACFD8-827A-4325-F623-DB8CDD5081DB' can't be found

Anyone who is relatively new to iPhone development could easily identify this issue is related to the invalid provisioning profile.

What if you receive this error even if you provide valid device, dev certificate, provisioning profile and bundle identifier? No clue right. I spent almost a day on finding the issue.

This can be resolved by copying all your classes/resources/other files to a newly created project. Easy solution isn’t it? but my case is different, the project was already renamed (Google on how to rename xcodeproj and the steps involved). As the project given to me was already renamed hence it has different name for xcodeproj, different name for appdelegate and another name for info.plist file, copying all the files to a new project is real pain. To add oil to the fire I was supposed to deliver the code to my QA to test the build on device before sending the code to customer by EOD and it was a Friday.

### Solution:

All you have to do is find the provisioning profile ID in your project.pbxprj file and replace it with valid provisioning profile that you had tried to build the code earlier.

*   Step 1: Open the **project.pbxproj** file in a text editor. (you will find this file in **YourProject/YourProject.xcodeproj** by control-clicking it and selecting "_Show Package Contents_")
*   Step 2: Replace all occurrences of the provisioning profile id from the error with the correct provisioning profile id from the organizer.

### Screenshots:

**How to find project.pbxproj**

Right click (Ctrl+click) your _**prjname.xcodeproj**_ file and select “**_Show Package Contents_**”. This will open the Finder with some files.

[![packagecontents](/assets/packagecontents.png "packagecontents")](/assets/packagecontents.png)

 [![project](/assets/project.png "project")](/assets/project.png)

**Find valid profile identifier of your provisioning file**  
[![organizer](/assets/organizer.png "organizer")](/assets/organizer.png)

**Where to replace the profile identifier**  
[![pbxprojx](/assets//pbxprojx.png "pbxprojx")](pbxprojx.png)

### Related Issue

> #### Check dependencies
> 
> #### \[BEROR\]CodeSign error: no provisioning profile at path '/Users/username/Library/MobileDevice/Provisioning Profiles/579ACFD8-827A-4325-F623-DB8CDD5081DB.mobileprovision'

The solution to the above error -  Rename your appname.mobileprovision with (alpha-numeric-name) specified in the error.


P.S  

Thank you [Anders](https://anders.com/) for correcting the text.