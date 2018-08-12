---
title: function.php
date: 2006-12-22T15:36:00.000+05:30
draft: false
tags : [hsbc, payment, code]
---

```
<?php
  /**
    * @desc Function to print variable for debugging
    */
    function printPre($data, $extended=false)
    {
        echo "<pre>";
        if($extended)
        {
            var_dump($data);
        }
        else
        {
            print_r($data);
        }
        echo "</pre>";
    }
?>
```