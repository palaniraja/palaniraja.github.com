---
title: 'How to implement HSBC Payment Gateway in PHP'
date: 2006-12-22T18:12:00.000+05:30
draft: false
categories: [projects, source code]
---

#### Requirements:  
  
1\. Storefront Id - Exactly 13 char string  
2\. HSBC Hash files - Executable files by HSBC  
3\. CPI hash key - Exactly 32 char string  
  
These are all details provided by the bank.  
  
Please go through the post [HSBC.php]({{< ref "hsbcphp.md">}}), [function.php]({{< ref "functionphp.md">}}), [hsbc_return.php]({{< ref "hsbc_return_php">}}) in this blog for the code and more Info.  
  
##### Note:  
1\. Even in Test mode, HSBC CPI require the real creditcard.  
2\. In Testmode value should not be greater than 1 pound.  
3\. The billing address and card holders address should be same.  
  
  
I would like to thank my msn buddy.