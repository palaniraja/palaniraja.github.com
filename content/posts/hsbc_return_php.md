---
title: hsbc_return.php
date: 2006-12-19T15:36:00.000+05:30
draft: false
tags : [hsbc, payment, code]
---

  

```
    <?php
       
        require_once "function.php";
        require_once "HSBC.php";
        printPre($_POST);
       
        $h1 = new HSBC();
        echo $h1->error($_POST['CpiResultsCode']);
    ?>
```