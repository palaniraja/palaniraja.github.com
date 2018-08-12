---
title: 'PeerGuardian and history.db'
date: 2010-05-16T12:02:00.001-07:00
draft: false
tags : [My Software Toolbox, Bug, info, PeerGuardian, solution, Tips]
---

[PeerGuardian](http://phoenixlabs.org/pg2/) is a great tool to maintain your privacy. But you should be aware of a fact that it uses a sqlite db to maintain the history called **history.db** in its directory under _Program Files._  
  

### Solution:

Shutdown the PeerGuardian 2 and delete the _C:\\Program Files\\PeerGuardian2\_**history.db**. PG2 will create a new _history.db_ on its next start.  
  
[![peerguardian-thumb](/assets/peerguardian-thumb.png "peerguardian-thumb")](/assets/peerguardian-thumb.png)  
  
Compared to the people [here](http://forums.phoenixlabs.org/showthread.php?t=16759) I found this early and truly enjoy the 2.8G now :-)  
  
I recommend you to clear/delete the file periodically at least once a month. I didn’t know the fact until today and it took 2.8Gigs :-(