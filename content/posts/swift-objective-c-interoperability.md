---
title: 'Swift/Objective-C Interoperability - Behind the "Configure Bridging Header" dialog'
date: 2015-02-21T07:03:00.001-08:00
draft: false
tags : [Swift., Notes, xcode, info, iOS, import, swift-objc-bridging, Tutorials, configuration, Obj-C, development, Tips]
---

_Disclaimer: Yes, I know about the typo "briding" in screenshots, but I'm lazy to redo all, so please ignore and read the article in peace :-)_

Apple officially supports mix-and-matching Obj-C and Swift code in same xcode project.

When you create a first ObjC in a Swift project or vice versa. Xcode ask your permission to create a special file called Bridging Header.

![](/assets/1-bridge-alert.png)

If you say _Yes_, xcode silently creates a new header file named **YourProjectName-Bridging-Header.h** and add to your project. If you observe it also modifies your project _(.pbxproj)_ file.

![](/assets/2-diff-prj.png)

From the _diff_, you can see that it adds three configurations

1.  Enable Clang Module,
2.  Swift Obj Briding Header and
3.  Swift Optimization Level.

### How to add the Bridging Header file manually?

You can say _No_ to xcode dialog for adding bridging file and still add the file manually.

### Bridging Filename should follow the same convension used by xcode?

The answer is **No**.

While searching answer for this question I found that the bridging file has to be added to your project's main group not under any other group.

![](/assets/3%2Bbridge-to-group.png)

Eg., I try to add **bridge.h** to subgroup and got the error.

```
bridging header '/Users/palaniraja/Desktop/Data/MyWorkSpace/try/swiftbriding/bridge.h' does not exist
```

Well, I was wrong. If you add it to a different group you need to provide the correct path. For instance, in this case it has to be `swiftbriding/bridge.h`

![](/assets/4-config.png)

Remember the three configurations added by xcode? when you set the **Objective-C Bridging Header** it add the other two _(Enable module and Optimization level)_ without any additional steps.

### Common Errors

* `... bridging header **'path_to/project/bridge.h'** does not exist`
    
Please check whether your bridge file is available and in correct path (typo is the number one culprit)
    
* `... error: use of unresolved identifier **'ClassName'**`
    
Check whether you had included the ObjC class you use is added/imported in your _bridge.h_ file.
    

### What is happening in build process?

Here is the screenshot of build steps with bridging and without bridging.

![](/assets/5-compile-sidebyside.png)

I've noticied that it failed when compiling the .m file which uses the swift object. So I was curious to see whether the _CompileC_ is passing any additional argument when you provide a bridging file. To my surprise, the compilec is identical for both.

![](/assets/6-filemerge.png)

I believe, the **Compile Swift source files** step does the necessary magic by linking/exposing the swift files to objc.

### Is there any difference in adding bridge file to a ObjC project / Swift project?

**No**

I have noticed only the project name is the only variable in this dialog.

![](/assets/7-sidebyside-bridge-alert.png)

### How to use ObjC classes in Swift project?

1.  Setup the Bridging Header properly
2.  Import all your ObjC class headers in your **bridge-header.h** file

### How to use Swift classes in ObjC project?

1.  Setup the Bridging Header properly. Yes it is required for Swift to ObjC as well
2.  Import the **yourprojectname-swift.h** in your ObjC file where you need to refer the swift classes.
3.  You do not have to create **yourprojectname-swift.h** file, the compiler will be creating the same in build phase.

![](/assets/8-projectname-swifth.png)