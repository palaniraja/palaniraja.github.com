---
title: 'Desktop Notification with Html5'
date: 2011-05-31T06:27:00.000-07:00
draft: false
tags : [ideas, Google, Html5, info, resource, chrome, solution, Tips]
---

I've recently stumbled upon [studio.html5rocks.com](http://studio.html5rocks.com/#Time!) and found the cool trick to display desktop notifications like [Gmail](http://gmailblog.blogspot.com/2011/01/desktop-notifications-for-emails-and.html).  

![](/assets/Screen shot 2011-05-31 at 7.02.36 PM.png)
  
I thought it is cool, thinking of including it in any of my app I plan to do.  
  
Here is the core part of the snippet.  
  
  

```
var notification = window.webkitNotifications.createNotification("http://www.google.com/images/logos/ps_logo2.png", "Title", "Notification message goes here");

notification.show();
```

  
  
But you have to ask for user permission before displaying the notification. Find the complete tutorial at [html5rocks.com](http://www.html5rocks.com/tutorials/notifications/quick/)