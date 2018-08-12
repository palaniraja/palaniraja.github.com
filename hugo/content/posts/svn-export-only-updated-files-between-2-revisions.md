---
title: 'SVN: Export only updated files between 2 revisions'
date: Sat, 20 Sep 2008 19:27:21 +0000
draft: false
tags: [lab, PHP, subverion export only updated, svn, svn custom export, svn export, svn export alternative, svn export only updated, svnexport advanced, tools]
---

Are you someone like me who is looking for an SVN command that exports the files updated between two revisions? Until now, I used to say that there is no such command available in SVN by default, or maybe now they have a feature to build in the next release. 

Don't lose hope. After having a hard time searching for an out of the box solution, I built my own with power of PHP ;) what else?

#### The scenario

*   Working with a team that uses SVN for versioning.
*   Your production server doesn't have svn, so you can't run the command svn update. Even if you have svn in your production server and your stupid system admin denied to open svn port of your dev server over firewall for security reasons(Believe me, it happens I wrote more than 10 email to my system admin, and I can't make him understand why we need this port to be open.
*   You need to upload the changes frequently and you have a very large list of directories which need to be chmod to 777 if you prefer uploading all again or,  you don't keep the files uploaded to the server in Dev (e.g. user images, videos are uploaded in the server are not required in Dev)
*   All you need is to upload the files which are updated after the previous build. It is not so easy if you have too many directories of hierarchy (or using a PHP Framework like me. i.e., controller, models, views, app etc.,) 

#### Prerequisites

*   What does **svn log** do? It's a command svn to list the files updated and other information in a revision or between two revisions, when you run the command "svn log -rM:N -v" (M,N are two revision numbers) in your working copy directory. You need the output of this command to provide the input for the script.
*   A working copy. (HEAD checkout from your Repo)
*   A directory with "chmod 0777″ for the script to copy only the updated files for upload. 

 

#### The Script

*   You can download the source [here](http://prjx.googlecode.com/files/svnexport.zip "Download the sourcecode").
*   View source [here](http://palani.bitsymphony.com/lab/svnexport/showsource.php?q=svnexport.php "View the source").
*   Try the [demo](http://palani.bitsymphony.com/lab/svnexport/ "Try the demo"). 

#### Screenshots

![](/assets/svnexport1.png)
![](/assets/svnexport2.png)