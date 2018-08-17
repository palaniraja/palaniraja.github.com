---
title: "Script to publish Hugo sites for Github"
date: 2018-08-17T18:50:27+05:30
draft: false
categories: [projects, scripts]
tags: [hugo, bash, automation, script, github]
---

While deploying my [recent hugo]({{< ref "website-redesign.md" >}}) website to github, I [re-learnt](https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/) that, you can only publish gh-pages from `master` branch for [user or organization](https://help.github.com/articles/user-organization-and-project-pages/) repository.

So had to change my workflow to remove all old static files from `master` and copy generated contents from hugo. 

It becomes tedious to remember not to delete `CNAME` or `hugo` folder from my repo everytime I had to copy the generated content. So I wrote a `bash` script to automate the tasks for me. 

Works great, now I do not have to remember the critical files and just `./publish.sh` from my `master` branch. 

Be very careful as it run [`rm -rf`](https://github.com/palaniraja/palaniraja.github.com/blob/master/publish.sh#L5) at line #5. So place the `publish.sh` only in your repo's _root folder_. 

### publish.sh

```
#!/usr/bin

echo "[ 1/3 ] Going to remove previously generated files"
# to delete files that are generated (.git and .ignore as they are hidden)
rm -rf `ls | grep -v "CNAME\|hugo\|README.md\|publish.sh"`

# switch to hugo directory and run hugo to build genereate content in hugo/docs and move generated files back to ./
echo "[ 2/3 ] To build static contents and copy"
cd hugo && hugo && mv docs/* ../ && cd ..
echo "COMPLETE"

# git commit changes as "publish"
echo "[ 3/3 ] Commit changes and push to github"
git add .
git commit -m "publish"
git push origin --all

echo "COMPLETE"

```

{{< mygist url="https://github.com/palaniraja/palaniraja.github.com/blob/master/publish.sh" >}}

