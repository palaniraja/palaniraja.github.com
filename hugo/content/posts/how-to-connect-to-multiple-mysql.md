---
title: 'How to connect to multiple MySQL servers from PHP'
date: 2010-03-10T17:18:00.001-08:00
draft: false
tags : [PHP, Tips]
---

Most of the PHP developers remember only the first three parameters of **mysql_connect (host, username, password).** There is a fourth parament called **$new_link** a boolean existscreate a new link. The default value is set to _false_.

```
<?php

    $link = mysql_connect('localhost', 'mysql_user', 'mysql_password');

    //create a new link/resource

    $linkRemote = mysql_connect('remotehost', 'mysql_user', 'mysql_password', true); 

    //pass the $link/$linkRemote as second argument to 

    //mysql_select_db,mysql_query functions to work on 

    //both the servers simultaneously. 

    //do stuffs

    //close both the connections

?>
```