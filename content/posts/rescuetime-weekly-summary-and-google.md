---
title: 'RescueTime weekly summary and Google Script'
date: 2013-11-03T00:17:00.000-07:00
draft: false
tags : [RescueTime, usage, Google Spreadsheet, Google Script, info, Personal, experience, ideas, My Software Toolbox, Data, GitHub, development, Productivity]
---

I was cleaning up my mac before handing it to systems on my last job. I had a couple of days just for the Knowledge Transfer of projects and nothing else. I have always run two or three passive self policing apps like [Rescuetime](https://www.rescuetime.com/) and [Timing](https://itunes.apple.com/ca/app/free-time-tracker-timing-lite/id467410757?mt=12) etc.,  
  
I have been using [Rescuetime](https://www.rescuetime.com/) for little over two years. Since I'm a cheap/free user, I cannot use their premium features like view or export past data. However, they send a weekly summary email with enough data. So I was curious to know the pattern of the way I work.  
  
I wrote a small [Google script](http://www.google.com/script/start/%E2%80%8E) that parses the text part of their email and save it in a Google Spreadsheet for analysing.  
  
Though I have two years of rescue time summary email, there are two different template. So I have parsed the email since Jan'13. (I believe they recently changed the template as of Oct-13.)  
  
  

![](/assets/Screen-Shot-2013-11-03-at-12.02.31-PM.png)

  

![](/assets/Productivetime.png)

  

![](/assets/hourslogged.png)

  

![](/assets/hours-categorywise.png)

  
  
I was quite happy that I am not that lazy ass as I thought. I have spent quality no. of hours on Software development and Utilities.

Utilities are mostly **Terminal/iterm2, nvalt**, custom tools I use outside of IDE but related to development. And I see I am consistent with my productivity % and the way no. of hours logged per week.  
  
You can find the script [here](https://github.com/palaniraja/RescueTimeSummary/blob/master/getRescueTimeText.gs) and the spreadsheet template I use to find the data [here](http://goo.gl/tz7zyH). I have cleared the content of `mail` sheet after running the `collectSummaryEmails` method from your clone of the sheet, you should see data from your Gmail. I left the other sheets with the data so you can follow.