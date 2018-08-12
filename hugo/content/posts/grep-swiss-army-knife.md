---
title: 'Grep - Swiss army knife'
date: 2013-07-20T11:11:00.001-07:00
draft: false
tags : [Linux, force.com, info, solution, salesforce, how to, ideas, csv, My Software Toolbox, grep, unix commands, command line, sublimetext, Tips]
---

  
I have used this command sparingly in the past and I recently learnt more options by solving couple of my problems. I really don't know whether grep is the right choice here, but hey! it worked :-)  
  

#### Problem 1: Filtering CSV

I had a very large CSV file of size 620Mb, a report exported from salesforce. I have to find the duplicate accounts and contacts with same email id.  
  
Excel and Numbers were either crashing or taking light years to respond to any of the action I had to perform on the data.  
  
The CSV was in the format:  
  
```
Email: unique@domain.com  
 
Contact: 1 Sales Contact  
Duplicate Contact 1  
 
Email: duplicate-exists@domain.com  
 
Contact: 2 Sales Contacts  
Duplicate Contact 1  
Duplicate Contact 2  
 
Email: duplicate-exists@another-domain.com  
 
Contact: 3 Sales Contacts  
Duplicate Contact 1  
Duplicate Contact 2  
Duplicate Contact 3

```

I knew I could just see how many contacts has duplicates by simply doing a grep -i 'contacts' | wc -l but I would like to know the email id associated with the contacts which is not in the same line.  
  
Quick search on man grep lists an option to print previous lines in addition to the line which matches the string. Here is the recipe I used to solve the problem.  
  

```
# this is to return all emails and sales contacts  
~/shell$ grep -B 2 'Contacts' filename.csv | grep 'Email:'
```

  
[From Manual](http://linux.die.net/man/1/grep) 


    -B num, --before-context=num  
        Print num lines of leading context before each match.  See also the -A and -C options.  

####  Problem 2: Objects and APEX classes linked to a particular object.

We are in need to provide effort required to do an impact analysis of migrating an existing salesforce object to a new object. This activity includes identifying the no. of classes has a reference to the object in question and an effort estimate to analyse those source files which has also has a reference to the object.  
  
To arrive an approximate effort estimate, we need a list of files and no. of lines of each files.  
  
Salesforce Schema browser is not very helpful if I want to know just the \_number\_ of objects associated, not what is the relation and how it is related to another object. And it is also a real pain to collapse and follow the links/pipes in a production environment with larger number of objects.  
  
Like every other occasion, management was asking the numbers as soon as possible. And developers were doing a Ctrl + F on Eclipse on classes and counting the no. of files. I could not suggest or question the team as I have only very little knowledge about salesforce APEX development.  
  
Since I am the author of iForce (a Sublimetext extension to help salesforce development) I knew that all the files are just text with metadata. So If I know the pattern to search for I could use grep to get the list of files and pipe it to wc to get approximate number we were looking for.  
  
Well, it took more time to finalise the pattern of object usage in APEX code than to find the number. Also the default payload.xml of iForce doesn't fetch all the required objects so I had quickly replaced the payload.xml on my iForce working copy with the one from Eclipse workspace.  
  
Once I refresh my [iForce](https://github.com/palaniraja/iForce/) working copy with one from the server, the answer is just a minutes away. Here is the list of commands I ran to get the number, I just copied it to excel, formatted columns with bright colour background for the people _above my food chain_ to process ;)  

```

salesforce-sandbox/classes$ grep -iE 'new contact||new account|' -l *.cls |wc -l 
  
salesforce-sandbox/triggers$ grep -iE 'new contact||new account|' -l *.trigger |wc -l  

salesforce-sandbox/components$ grep -iE 'new contact||new account|' -l *.component | wc -l


```

  
**P.S**: 
Though count from `wc -l` doesn't provide the meaningful number of lines as [CLOC](http://cloc.sourceforge.net/). But I was in a hurry, and I have not tried CLOC with [APEX](http://www.salesforce.com/us/developer/docs/apexcode/) code.