---
title: 'Random Notes: LAMP/Web development |Tools & Best practices'
date: 2010-06-23T11:35:00.001-07:00
draft: false
tags : [experience, ideas, My Software Toolbox, Firefox, Best Practices, PHP, presentation, info, solution, Tips]
---

I was planning to write a post similar to this for very long time. My intension is to help beginners to know the jargons and best practices. Please add your comments and I will update.

## Front-end (HTML/CSS/JS)


*   HTML should be validated.
*   Should test your web page/application with IE/Firefox/Webkit(Safari/Chrome)
*   CSS - Organize your CSS files and there is a [great tutorial](http://www.sitepoint.com/videos/videocss1/) (video 1) from Sitepoint.
*   Write unobtrusive JavaScript. Separate your design and logic; html should be free of DOM event attributes. [Link 1](http://en.wikipedia.org/wiki/Unobtrusive_JavaScript) | [Link 2](http://icant.co.uk/articles/seven-rules-of-unobtrusive-javascript/)
*   Optimize your front-end: [YSlow](http://developer.yahoo.com/yslow/help/#guidelines) has set of rules to optimize front end (Caching PHP scripts are so old tricks)
*   Use JS frameworks and I suggest [jQuery](http://jquery.com/). JS frameworks helps you not to worry about browser identification and common AJAX calls and [more](http://www.visualjquery.com/). And there are plug-ins available.

#### Tools

*   There are many tools to validate the html and I found [HTML Validator](https://addons.mozilla.org/en-US/firefox/addon/249/) for Firefox is the great tool and it validates offline.
*   [Browser Labs](https://browserlab.adobe.com/) by Adobe is another tool to test all major browsers.
*   [Portable Firefox](http://portableapps.com/apps/internet/firefox_portable#legacy) version are available to major versions.
*   [IE Tester](http://www.my-debugbar.com/wiki/IETester/HomePage) is a great tool to test multiple version of Internet Explorer.
*   [Firebug](https://addons.mozilla.org/en-US/firefox/addon/1843) – Javascript/AJAX debugging tool ([Tutorial](http://www.evotech.net/blog/2007/06/introduction-to-firebug/))
*   [Web Developer](https://addons.mozilla.org/en-US/firefox/addon/60) – The best tool before the rise of Firebug, but it still has the unique features.
*   [YSlow](https://addons.mozilla.org/en-US/firefox/addon/5369) – A great extension from Yahoo UI (YUI)

## PHP


It is a simple language to learn, it was tailored to do so. The same advantage is its curse many do not follow standards. We no longer write simple _write and forget_ scripts, we develop websites and application that are continuously updated/upgraded. You cannot always remember the reason why you wrote the logic that way. So always document the files, use [PHPDoc](http://manual.phpdoc.org/HTMLSmartyConverter/HandS/phpDocumentor/tutorial_phpDocumentor.howto.pkg.html) ([tutorial](http://manual.phpdoc.org/HTMLSmartyConverter/HandS/phpDocumentor/tutorial_phpDocumentor.pkg.html)).

#### Coding Standards

*   [PEAR Standards](http://pear.php.net/manual/en/standards.php)
*   [Zend Framework Standards](http://framework.zend.com/manual/en/coding-standard.html)

#### Frameworks

Thanks to Rails (Ruby on Rails) it changed the way we use to code. Web developers were porting the features by developing PHP Frameworks and there were many frameworks available now. I prefer/suggest [CodeIgniter](http://codeigniter.com/) and Zend Framework for many reasons (I'll try to explain the reasons in another post). Use CodeIgniter ([manual](http://codeigniter.com/user_guide/) | [Tutorial](http://codeigniter.com/tutorials/)) for every (Small/Medium) project/site you will reap only benefits and use [Zend Framework](http://framework.zend.com/) for Enterprise/Large projects.

**Optimization**: There are many things you can do before thinking about optimizing your script before jumping into caching/profiling it. Follow the simple tips like [Link 1](http://hungred.com/useful-information/php-micro-optimization-tips/), [Link 2](http://ilia.ws/archives/12-PHP-Optimization-Tricks.html)

## Version Control

I have seen people who copy a script from live servers and rename it with date stamp before editing it. There are better alternatives available called version control a great tool developed by the developers for the developers (Wow! Close to the definition of democracy). It helps us to revert back to a particular version in a second. You can analyze the log, archive a version by tagging it. It can help multiple developers to work on the same file. Whatever I have listed are very few benefits you get by using version control. I use [SVN](http://subversion.tigris.org/) for almost all my project and I suggest you to try the same.

*   [A Visual Guide to Version Control](http://betterexplained.com/articles/a-visual-guide-to-version-control/)
*   [Tortoise SVN](http://www.igorexchange.com/node/87) Tutorial

Testing
-------

Testing is important to any project though I do not share good relationship with my testers :) (who accepts their faults). Programmers always test only positive/happy flow by default and testers are there to help us on developing the usable project for real time users.

And as a web developer we have more HTML forms to validate user inputs. Rule of thumb, do not trust input from users always validate.

We programmers do test the form we just add validation; however we don't retest the same sequence of inputs that we have tested before adding an extra validation to the form. There are tools that capture our actions/inputs from the browser and replay the same N times. Tools like [iMacros](https://addons.mozilla.org/en-US/firefox/addon/3863/) for Firefox are providing many options which can be overridden. This helps you to unit test your frontend. There is a unit testing framework called [PHPUnit](http://www.phpunit.de/) which helps you to unit test your backend/business logic so future update will not mess the site/application.

I am not aware of tools like iMacros for other browsers. I have used iMacros for testing validations of form and I have not found an occasion where the same fails in other browsers. Other than unit testing you should also test for the following

*   Test for XSS ([Cross site scripting](http://en.wikipedia.org/wiki/Cross-site_scripting))
*   Test for [SQL injection](http://unixwiz.net/techtips/sql-injection.html)

If you validate your users' inputs then you are almost made 80% XSS and SQL injections are byproduct of malicious inputs.
