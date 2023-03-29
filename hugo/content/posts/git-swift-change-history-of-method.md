---
title: "How to view git change history of a Swift method"
date: 2023-03-28T19:54:59-07:00
draft: false
---




I knew git has a feature to get change history of a method. 

e.g., `git log -L :myfunction:path/to/myfile.c` list all the commits that changed something in method/function named `myfunction` in file `myfile.c` [stackoverflow](https://stackoverflow.com/questions/4781405/git-how-do-i-view-the-change-history-of-a-method-function)

 I used it all the time with ObjC but it never worked for swift files. I always thought it is because of ObjC and C language similarties. Few years ago, I came across [this tweet](https://twitter.com/kastiglione/status/1242113018474819584) and I realized this is something I can [define for git](https://www.git-scm.com/docs/gitattributes). 
 

## Before and After


![Before - Git throws a Fatal error and no match](/assets/swift-git-method-history-before.png)

![After - List the commits that has changes to the method](/assets/swift-git-method-history-after.png)


## How-to

You need to update couple of meta files in your `.git` directory of your git workspace. If you do not find these files in your git workspace, you can create an empty file and add the contents


```
# Step 1: Add this to your .git/info/attributes
*.swift     diff=swift


# Step 2: Edit your `.git/config` and add 
[diff "swift"]
    xfuncname = "^ *(\\w+ +)*((class|struct|enum|protocol|extension|func) +|(de)?init\\b).*$"
```


I had tried few other _regex_'s for `xfuncname`, but the one above is my current version that I use. Here are some I found in github

```
#    xfuncname = ^[ \t]*((class|func)[ \t].*)$
#    xfuncname = "^ *(\\w+ +)*((class|struct|enum|protocol|extension|func) +.*|(de)?init\\b.*|(var|let) +(.+?): +(.+?)\\{)$"

```


#### References:

* https://twitter.com/kastiglione/status/1242113018474819584
* https://twitter.com/kastiglione/status/1242116999494242305
* https://stackoverflow.com/questions/4781405/git-how-do-i-view-the-change-history-of-a-method-function
* https://devhints.io/git-log-format
* https://www.git-scm.com/docs/gitattributes



---

This post was in my draft for a very long time. Recently, I had to set this up again for a new project. I realized I couldn't cleanup my draft and publish to get out of this pandemic _writer's block_ and also a quick reference for me in the future.

Well spent a day to [fixing my theme](https://github.com/palaniraja/palaniraja.github.com/commit/4ed9d52e6901dfeae6f8fbfd150526e537db9dfe) to support [Hugo](https://gohugo.io) changes since my update :-)