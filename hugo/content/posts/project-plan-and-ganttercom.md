---
title: 'Project Plan and Gantter.com'
date: 2013-03-30T07:08:00.000-07:00
draft: false
tags : [gantter, tools, issues, project planning, info, experience, gantt charts, Getting-things-done, planning, free, bookmarks, msproject, development, Ideavault, project, software engineering]
---

Project planning is always a difficult task for me. I could do anything to skip the project planning because for following reasons:  

  

* I know right away I am not going to meet the deadline, regardless of time provided.
* Splitting the tasks to be developer friendly, without modifying the timeline promised to client by sales is very hard.
* The tasks breakdown provided at the time of proposal is never the same. 
* Introduce milestone to match the target revenue set for the subsequent months by your division.
* And I hate anything related to Money (Revenue/Commercials)

For some reasons I always end up as a Technical lead who does everything related to project /people management in addition to actual development. It has been the same in all the companies I worked so far. Though I know it is good for me in career, every time, I think it is a Project managers' responsibility and they are delegating. I do them with cursing every minute.

  

This past week, I was assigned to prepare a plan for a new project. We don't use MS Project and the Excel format which we use is not very helpful If I miss a non-working day or any modification of tasks to be done in middle of planning. Since I hate it, i was procrastinating happily in finding alternatives. 

  

\-\-\- ✄ ---

  

[Gantter.com](https://app.gantter.com/) is in my bookmarks for long time, though I didn't use it heavily I thought I had give a try. After spending 3+ hours with it, I kind of liked it. It is far better than MS Project whatever the version I used long ago. 

  

As a true developer and [a person who notice everything](http://qcfailed.tumblr.com/), I also jolted few features that could improve this tool a lot. They do support extensions and I'm yet to explore the documentation. Hopefully someone could implement the following features someday.  
  

* Modify/Assign resources for multiple tasks?
* Keyboard friendly Predecessors 
* An autocomplete text/dropdown with `{Id}-{Task Title}` eg., `2 - Wireframe internal review`
* Option to view just the duration of filtered resource?
* Filter tasks for more than one resource
* Export to Excel? (just as values should be a good start)
* Calendar - Marking non-working days could be easier
* Tasks properties Dialog
* In addition it could have `{Id}-{Task Title}` in the title.
* Keyboard shortcuts 

![](/assets/the-big-picture.png)

  

### Modify/Assign resources for multiple tasks?

Right now, you had to manually click each task row and select a resource to assign. This could be simplified, by providing a multi check options to update resource and their utilisations for multiple tasks?

  

![](/assets/assign-resources.png)

  

### Keyboard friendly Predecessors 

The same for Predecessor, I agree if you have more resource you don't include a constrain of completion date for previous task as Finish-to-start for every item. But my issue here is not a multiple update. But have an autocomplete text or a drop down to easily select the predecessor.

Or you could go crazy like Xcode4/Interface Builder or Omnigraffle like joining tool.

  

### Option to view just the duration of filtered resource?

When you filter by resource, the total hours displayed are not the sum of hours for the resource.  It is the same as the complete plan.

  

![](/assets/filtered-Dev1.png)


![](/assets/no---filter.png)

  

### Filter tasks for more than one resource

If you provide option to filter tasks for multiple resources say I would like to know the tasks assigned for _Dev1, Dev2_ in case of development and _Tester1, Tester2_ to know my test schedules.

  

### Export to Excel?

One thing I learnt in my experience is all bosses would like to see the plan in Excel. Trust me, I wrote a project time sheet management tool with [Google Apps Script](https://developers.google.com/apps-script/). My VP approved this crazy idea because they can just view their data in a spreadsheet. 

  

As of now Gantter doesn't allow multiline copy. Right now, I use a workaround, **Project -> Printable HTML** and copy the content to [Sublime text](http://www.sublimetext.com/2), and do a _Find & Replace_ to get the tasks list.

  

### Calendar - Marking non-working days could be easier

All you have to do to mark a working day as holiday/non-working day, you need to goto a calendar properties. Select a date and clear the working time. This is not very friendly, it would be cool, if I enter/key in series of days to be ignored in planning.

  

### Tasks properties Dialog

Refer the image, it would be immensely helpful to know which task is getting updated. I'm not sure whether it is a bug, I see the task list in the plan is scrolled to bottom. May be I was having a FS constraint at the bottom related to the particular task, but it was annoying, to click the General tab to know which tasks I'm correctly looking at. 

  

![](/assets/Task-dialog-title.png)

  

### Keyboard shortcuts 

Because of Google, I can't live without keyboard shortcuts. It is also a reason why I can't switch to Feedly like everyone else.

If you provide  keyboard bindings for Task properties dialog to switch between the tabs or the fields, it would be helpful.

  

The current plan is not an exhaustive list of tasks (around 120+ line items). Still I think Gantter could be more helpful with the suggested features.