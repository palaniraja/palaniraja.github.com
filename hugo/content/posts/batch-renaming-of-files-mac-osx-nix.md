---
title: 'Batch renaming of files (Mac OSX / *nix)'
date: 2010-04-08T20:35:00.001-07:00
draft: false
tags : [ideas, info, solution, commands, Tips]
categories: [projects, scripts]
---

How to batch/bulk rename files with automatic sequence number? Try the following shell script from your terminal (OSX/*nix)  
  
1. Create a new directory **_<newdir>_**  
2. Run the following command (you can replace _**newdir**_ with the your directory name and _**some_prefix**_ with your prefix the same applicable for extension as well. My eg., rename only the _**png**_ files of the directory (there were no other extensions available).  
  
`i=0; for x in *.png; do cp \"$x\" "newdir/some_prefix_$i.png"; i=$(($i+1)); done`  
  

Windows should have supported bash scripts natively. OSX is handy only because they inherited from unix.


#### Update:

It doesn't solve the natural ordering sorting problem eg., `File1.png, File10.png, File2.png`.

* [Stackoverflow](https://stackoverflow.com/a/7992921/240255)
* [Macworld](http://hints.macworld.com/article.php?story=20030724161328982)