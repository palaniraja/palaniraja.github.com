---
title: 'iForce - Sublime text plugin for salesforce development.'
date: 2012-12-15T00:10:00.002-08:00
draft: false
tags : [force.com, Windows, python, editor, info, salesforce, how to, ideas, addon, open source, plugin, code, extension, GitHub, sublimetext, Tips]
---

  
I wrote a small plugin for sublime text to develop salesforce. I'm glad to share one of my _idea to project_ execution.  
  

![](/assets/6_Create_new_project.png)

  
  
My recent project was developing a mobile app (jquery mobile) for salesforce. I find it is tedious to use eclipse/Force IDE for modifying single APEX page, the rich-text editor with syntax highlighting provided by salesforce web interface is not very helpful.  
  
As "productive" developer I was looking for other options, I found ForceDotBundle for textmate and Mavenmate for Sublime text.  
  
I settled with ForceDotBundle atlast, as I figured I don't need all the features of Mavenmate. I could not recommend any to my fellow teammates, who use Windows as their primary development machine. As far as I know there is no real alternate to Eclipse/ForceIDE for Windows users.  
  
So I saw an opportunity to learn to develop sublimetext plugin. My initial feature set were  
  
✔ Basic Authentication  
✔ Get latest version of source files from salesforce org  
✔ Push local changes to salesforce  
✔ Auto syntax highlight/color  
✔ Snippets (boilerplate code for new apex class/trigger/page)  
☐  Keep changesets in local git repo  
☐  Option to run SOQL query without leaving sublimetext  
☐  Get fields of a an object by selecting object name.  
☐  Execute selected code and return results (Developer console)  
  
I settled with deploying code with ant, as my original idea of calling webserivce to push/pull/execute would require good knowledge of python which I lack at the moment.  
  
[iForce - Source](https://github.com/palaniraja/iforce) | [How to - iForce](http://palaniraja.github.com/iForce/)