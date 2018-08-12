---
title: 'The bug that *still* haunts me'
date: 2014-04-27T08:17:00.000-07:00
draft: false
tags : [css, testing, QA, developer, text]
---

My recent project was to build an html5 app on top of Salesforce1. As usual after the development is complete we send it to QA for approval. And then they log this bug.  
  

![](/assets/Screen-Shot-2014-04-27-at-8.41.26-PM.png)

  
  
Almost 10 years ago, when I started developing websites, I kind of aware of this bug and I ignored it because, I did not know the solution and I never expected any valid/meaningful users would enter such junk values.  
  
However, I was looking for solutions as I grow up, this is before the CSS era when **font**  
tag was most used one in webpages. All then dev forums are either ignoring it saying there are no acceptable solutions.  
  
When I learnt about CSS I discovered the gem called _overflow:hidden_and waited for  I started overusing this property. But the testers still log an issue related to this, not all the entered text are visible.  
  
Eventually, I discovered couple of new CSS properties `word-wrap:break-word` and `text-overflow:ellipsis` to overcome this issue. Again, these are _\_recently\__ added and only now it is commonly supported in all the browsers. Still, `text-overflow:ellipsis` works only for single line text at the moment?(_why_!)  
  
To summarise, this is the bug which shoots my blood-pressure as high as Mount Himalayas. Because I get this even before the functionalities are tested.  
  
#### Update:
  
While rereading the post, I noticed I didn't explain my current solution. At the moment, I just use javascript and add ellipsis by truncating if the content length is greater than arbitrary number (_n_). For eg., the following use 500 as '_n_'.  
  

![](/assets/Screen-Shot-2014-05-03-at-10.17.03-PM.png)

  
I am still not happy with it, as you see in the image. We can't use the number 500 for all string unless you use fixed-width font. And I am not aware of solutions to identify the (_n_) based on the given font size & container size. (Refer: [NSAttributedString](https://developer.apple.com/library/ios/documentation/uikit/reference/NSAttributedString_UIKit_Additions/Reference/Reference.html#jumpTo_5))  
  
Matter of the fact, I just can't set `text-overflow:ellipsis` to all in my `normalize.css` or `reset.css` because this is not expected from any useful data.