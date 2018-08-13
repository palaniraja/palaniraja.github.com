---
title: 'Poor man''s pdf diff tool'
date: 2018-05-08T06:30:00.000-07:00
draft: false
tags : [how to, ideas, Diff, bash script, utility, command line, PDF, commands]
categories: [projects, scripts]
---

Recently a client shared updated requirement document, unfortunately the document was in PDF and I don’t want to go through 60+ pages of document for changes.  
  
Then this crazy idea pop’s in my head, why can’t I do a diff on these pdf with a simple script. Reason is, I do not want to use any online tools, or want to install anything from Adobe.  
  
The idea was to export the pdf to images and do a image diff in batch. I already have _automator_ script to convert pdf to png and _image magick_ installed on my machine.  
  
* Step 1: Convert the **pdf** to **png** using the **automator** script  
* Step 2: Batch rename the files like **1.png, 2.png** etc.,  
* Step 3: run `magick compare` in batch using simple one-line shell script  
  

```
for i in $(seq 62 $END); do magick compare ../v1/$i.png ../v2/$i.png diff-$i.png; done 
```



  

![](/assets/Screen-Shot-2018-05-02-at-10.04.00-AM-copy.png)
  

**Note**: 62 is the no. of images in each directory. **v1** & **v2** are two directories with images in sequence eg., `v1/1.png`, `v2/1.png`
  
![](/assets/Screen-Shot-2018-05-02-at-10.10.06-AM.png)  
  
Due to some silly font rendering issues (Microsoft Word), I got some pages with output like below, but overall the it worked as expected.  
  
![](/assets/Screen-Shot-2018-05-02-at-10.04.16-AM.png)


### Automator workflow for PDF to PNG

![automator workflow pdf-to-png](/assets/pdf-to-png-automator-workflow.png)