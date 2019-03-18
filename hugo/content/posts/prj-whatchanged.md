---
title: "Whatchanged - Git history as HTML Report"
date: 2019-03-18T10:04:20-07:00

tags: [projects, bash, git, script]
categories: [projects, scripts]

---


Recently I was requested to produce a report of changes in a git repo between two tags by testing team. I am not sure the basis of the request, as they can go through the git repo themselves. I also kind of thought it is better to have a separate report that can be uploaded to their release ticket for archival; instead of going through each commits between revisions or any changes to repo history. 

Initially they want to produce an excel report I wrote a simple [bash script](https://github.com/palaniraja/whatchanged/commit/30f731dfcd4bec2be3a023a09150e076b03e9738) to generate the files modified between two revisions and their commit logs (reason for the changes). 

As usual, [scope](https://gist.github.com/palaniraja/2bb7d7d64eef279e683b43e19c56c555/revisions#diff-75153e0b9726055d043a88aff751082c) of the request grown to include source comparision with diff as well. Somebody had shared Beyondcompare report with them earlier. Since I don't own a license and an opensource fellow, I built one  with the help of [`git log`](https://git-scm.com/docs/git-log), [`git diff`](https://git-scm.com/docs/git-diff) and [diff2html](https://github.com/rtfpessoa/diff2html). I was able to produce a decent report with this, unfortunately it takes a long time to render if the no. of files and commits are on a larger side.

Anyhow, it does the job, I'm proud of the accomplishment in my first week here in my dream country. 

If you find it useful and interested in extending, please go through the TODO list of [repo](https://github.com/palaniraja/whatchanged#todo) and share PR.


---

Github: [Whatchanged](https://github.com/palaniraja/whatchanged)

---

### Usage & Output

```
# sh whatchanged.sh <startCommitSHA> <endCommitSHA>
```
e.g.,
```
sh whatchanged.sh 3b9aea39c7 37c07544408b
```

{{< img src="/assets/whatchanged-diff.png"  caption="Whatchanged - sample report" >}}