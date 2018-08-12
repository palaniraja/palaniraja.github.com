---
title: 'SVN: Auto UPDATE WORKING COPY after COMMIT'
date: Fri, 05 Sep 2008 19:12:02 +0000
draft: false
tags: [auto update, commit automate, lab, PHP, subversion auto update, subversion hooks, svn, svn hooks, tools]
---
In one of our recent project, we were looking for an automated script that update the working copy of our dev server as soon as someone commit the changes to the SVN. 

We were using a Linux server (Fedora) to integrate all the modules developed by almost 15+ developers. I learnt a valuable lesson from the projects in the recent past, it is not so easy to integrate all the modules developed by a team at the end of the project. So I suggested my team that integrating modules while developed would be the best thing (from my exp. anyway ). 

Our Dev server running SVN and LAMPP, all we need is an automated script that updates the working copy of our application which resides in htdocs of LAMPP as soon as someone commit their changes, so that they can easily identify the issues as soon as someone commit the conflicts. And also it would be really easy for us to show the demo of the app. at any to the client (i.e., No integration headache at the time of the call).

### PHP: the right tool?

As usual I wrote a script in php to run the SVN UPDATE command with PHP `exec()` function. Oops!! It doesn't work as expected. 
```
<?php 
    $ret = exec(‘svn update /opt/lampp/htdocs', $ret2, $ret3); 
    echo  $ret; 
?> 
```
I stumbled Google to know what's wrong with this code. It returns the following valuable results. 

I finally have come to a conclusion that PHP is not the precise tool for the task. So "How did you achieve? Which is the best tool to achieve this?" 

I can't say which one is the best, but this is how I automate the task. 

SVN has a feature built-in called **[hook](http://svnbook.red-bean.com/en/1.4/svn-book.html#svn.ref.reposhooks)** which is designed specifically to do similar tasks. Don't know why I'm hearing hooks frequently now-a-days (Drupal uses hooks, Joomla 1.5 uses hooks, hooks! hooks!! hooks!!! )

### Steps:

*   Create a file in **C** to run the command "**svn update**". In my case the file was s**vn_update.c** in **/bin**.
*   **svn_update.c**

```

    #include <stddef.h> 
    #include <stdlib.h> 
    #include <unistd.h> 
    int main(void) {
        execl("/usr/bin/svn", "svn", "update", "/opt/lampp/htdocs/ ", (const char *) NULL); return(EXIT_FAILURE);
    }

```
*   Compile the file with the following command "**gcc svn\_update.c -o svn\_update**"
*   Create a file called "**post-commit**" in the hooks directory of your SVN repository:
*   **post-commit**

`# #!/bin/sh /bin/svn_update`

*   Chmod your post-commit with the following command "**chmod 0755 post-commit**"

  That's all you have to do, now SVN will do the rest. You can download the files, svn_update.c and post-commit [here](http://prjx.googlecode.com/files/svn-auto-update.zip).  

### References:

* Apache SVN @  [http://www.sematopia.com/?p=218](http://www.sematopia.com/?p=218) 
* Alternate to C @ [http://forum.webfaction.com/viewtopic.php?id=964](http://forum.webfaction.com/viewtopic.php?id=964) 
* Mighty C code @ [http://forum.webfaction.com/viewtopic.php?pid=216#p216](http://forum.webfaction.com/viewtopic.php?pid=216#p216)