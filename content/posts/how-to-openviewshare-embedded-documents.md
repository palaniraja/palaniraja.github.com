---
title: 'How to open/view/share embedded documents in Microsoft Word for Mac (2011/2016)'
date: 2016-03-28T02:28:00.000-07:00
draft: false
tags : [experience, how to, ideas, Microsoft, Tutorials, mac app, Mac, Bug, hacking, office]
---

You would be surprised to know that Microsoft doesn't support a viable option to view embedded documents. Embedded PDF's are the worst, even the .docx files doesn't allow you to save even in latest version of Microsoft word for OS X.  
  
What is even more surprising is that why can't they provide a "save as" option when I do right click on the embedded object?  
  
After a lot of digging I've figured out the way to view all the embedded files, though it is not easy it is better than booting your VM for this task alone.  
  
Basically rename your **.docx** or **.xlsx** file to **.zip** and unzip using your favorite application. If you digg deeper, in my case I was unzipping **.docx** file, you can find all the embedded document in "**/word/embeddings**" path. In my case all the pdf's are embedded as **oleObject.bin** which can be unzipped to view the original pdf file "**CONTENT**" after renaming it to ".**pdf**"  

![](/assets/Screen-Shot-2016-03-27-at-9.10.03-PM.png)


#### Update: 
  
If the file is old **.doc** format, I found the embedded files are in the following directory "**ObjectPool**" with file as "**Package**". Refer image below:  
  

![](/assets/Screen-Shot-2018-06-07-at-11.29.50-AM.png)