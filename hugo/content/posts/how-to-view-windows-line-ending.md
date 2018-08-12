---
title: 'How to view (Windows) line ending characters on Mac OSX'
date: 2011-06-15T05:18:00.000-07:00
draft: false
tags : [experience, My Software Toolbox, Tutorials, Compatibility, editor, unix commands, info, commands, Tips]
---

[Notepad++](http://notepad-plus-plus.org/) on windows has this beautiful option "View all characters" to display all invisbile characters such as line endings.  
  

![Notepad++ ](/assets/image001.png)
  
  
  
Programming editors on mac like [Textwrangler](http://www.barebones.com/products/textwrangler/) and [Textmate](http://macromates.com/) has an option to _Show Invisibles_ but failed to display the character block for Carriage Return as Notepad used to.  
  
Textwrangler beats Textmate on this case where it display two special characters to refer **CR** and **LF**, where Textmate display only one character.  
  

![Textwrangler](/assets/Screen-shot-2011-06-15-at-5.24.23-PM.png)


![Textmate](/assets/Screen-shot-2011-06-15-at-5.25.23-PM.png)

  
Our recent iPad project write csv file which is further parsed by a third party app. The 3rd party app requires the line ending to be a combination of Carriage Return (CR) and Line Feed(LF) instead of just Line Feed (LF) as traditional Unix/Mac. To test the csv generated is good, I had to view the character myself in any other editor.  
  
After few failed attempts with both Textwrangler and Textmate, I came across this powerful unix tool called [OctalDump](http://unixhelp.ed.ac.uk/CGI/man-cgi?od) (od) which is part of OSX.  
  

```
od -c filename.csv
```

  
will display the file with C-Style escaped characters. CR as **\\r** and LF as **\\n**. It has numerous no. of [options](http://unixhelp.ed.ac.uk/CGI/man-cgi?od) to explore.  
  
  

![od - command](/assets/Screen-shot-2011-06-15-at-5.18.57-PM.png)