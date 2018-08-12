---
title: 'Google Chrome : The application failed to initialize properly (0xc0000005)'
date: Wed, 03 Sep 2008 07:32:52 +0000
draft: false
tags: [chrome, general, google, google chrome, How to, symantec]
---
 

```
The application failed to initialize properly (0xc0000005). Click on OK to terminate the application
```

Symantec causes this issue and the temp. solution is to disable the sandbox. And the solution from Google Groups is   
You can try running Google Chrome with **`--no-sandbox`** (you need to edit the properties of the shortcut you use to launch it).

**More links:** 

**Issues** : [https://groups.google.com/group/google-chrome-help/search?q=&start=0&scoring=d&enc\_author=LjzA1TIAAACxnAQgd0s-x2NJHdBMCj1kX8-qliYfOMJi0wlpwfQxL7SnwL2ldEkDZ3UGY4Fi834vPp-8dun\_mzBPI6iup1z0&](https://groups.google.com/group/google-chrome-help/search?q=&start=0&scoring=d&enc_author=LjzA1TIAAACxnAQgd0s-x2NJHdBMCj1kX8-qliYfOMJi0wlpwfQxL7SnwL2ldEkDZ3UGY4Fi834vPp-8dun_mzBPI6iup1z0&) 

**Solution 1 :** [https://forums.symantec.com/syment/board/message?board.id=endpoint_protection11&thread.id=15816](https://forums.symantec.com/syment/board/message?board.id=endpoint_protection11&thread.id=15816)

**Solution 2 :** [http://code.google.com/p/chromium/issues/detail?id=38#c26](http://code.google.com/p/chromium/issues/detail?id=38#c26) 

**Update:**

*   I wrapped "`--no-sandbox`" in CODE tag now to resolve WP double hypen to emdash conversion.
*   Symantec is not the only known source to this issue.
*   To know more about what is sandbox? Please try the pages 25,26 on the book [http://www.google.com/googlebooks/chrome/](http://www.google.com/googlebooks/chrome/)