---
title: 'Website redesign'
date: 2018-08-12T21:04:43.002+05:30
draft: false
tags : [redesign, PSA, Hugo, StaticSite]
---

Today I'm launching the redesigned website [palaniraja.com](https://www.palaniraja.com). It's a shame that I took to this much time to update my own website which I've paying for years. But that's a by-product of working on your own project without timeline or external pressure :-)

Even today, I had to take a decision to push this version as it is fully functional for almost a week, and my list of pending items is still growing. I hope to publish changes in subsequent days/weeks.

### Idea and Execution

* Wanted a simple markdown based website
* Wanted to host on github [https://palaniraja.github.com/](https://palaniraja.github.com/)
* Content Types 
    * [Blog](/posts)
    * [Projects / Products](/projects)
    * Photo Gallery for featuring my favorite photos -TBD
* Simplistic theme and fast rendering website

Almost 2 year old todo list from my [org](https://orgmode.org/) file.

![hugo-action items ](/assets/website-plan.png)

### Technical details

- Rebuilt this using [Hugo](https://gohugo.io/) 

An opensource static site generator written in [Go](https://golang.org/). I chose this years ago when I was interested in learning [Go](https://golang.org/). Though I haven't invested much time in [Go](https://golang.org/). I figured the customization I expect for my site can be done with just templating. And it has good community support and articles for customization
    
- Theme - `min`

I built my own theme named `min` for minimalistic. It is based on a theme [whiteplain](https://themes.gohugo.io/themes/whiteplain/) which is similar to my liking, but I had to build several components on top of it. Will shortly publish the source code.

For CSS, I used [milligram.css](https://milligram.io/) - a small 2kb gzipped library to help with defaults and typography. Though I do not use any of their grids or forms styles. I still use the complete css, for easier upgrade later.

##### Decisions

1. Not to use any 3rd party javascript framework. 
2. No Tracking codes. 
2. Not to embed any 3rd party widgets. 
    * This is very hard. E.g., I host code snippets on Github and videos on Youtube. But decided privacy of users and speed of page is more important than an additional click
    * Good old hyperlink will take them to 3rd party sites when necessary
    * And I keep a copy of code snippets part of post so it would work with RSS feed readers
    * Built couple of Hugo [shortcodes](https://gohugo.io/content-management/shortcodes/) for embeding contents which then links to 3rd party website.


- Importing old blog contents

Since I've been blogging over a decade and I have contents in several platforms. I wanted to merge it in a single place as well as a simple non-proprietary backup.

After trying few solutions, I wrote my own script [blog2md](https://github.com/palaniraja/blog2md) to backup both Blogger and Wordpress blog contents. I even got it updated in [Hugo Docs](https://gohugo.io/tools/migrations/) for others to use.

- Comments

Since this is a static website, it can't have comments. Though the whole world decided against comments. I still love an insightful comment or an appreciation on a post from strangers. I like to think of post without comments as [Stackoverflow](https://stackoverflow.com/) posts without answers.

I do not want to use the _de facto_ standard for Static sites - [Disqus](https://disqus.com). It is an additional 3rd party dependency with embeds. So I decided to go with [Google Forms](https://www.google.com/forms/about/). Yes it is also a dependency but already Google has all my info. And I prefer Google over Disqus. I decided to link instead of embeds because I don't want to inject codes which I don't have control over.



### Sections

- [Projects](/projects)

This will be the product page for all my projects and scripts. Top featured projects are listed in Home itself.

- [Blog](/posts)

To host all my old blog posts and comments. Migrated using my own [blog2md](https://github.com/palaniraja/blog2md) and edited few posts for dead links and contents.

- [DevDiary](https://palaniraja.github.com/devdiary)

A footer link at the moment. Will think of a place to feature this in top navbar. And I should keep logging more contents from my notebook.

- Resume - A major component pending item from this release

This is definetly a reason why this project was delayed. I wanted to do a cool resume page part of website deployed since the domain purchase. But I could not make up my mind to choose one. My current plan to create a single page PDF with just high level technical information and link it.

Ask the recruiters and spammers to mail for more info which includes private information.


#### Current revision

{{< img src="/assets/website-v3-hugo-min.png"  caption="Current Release 3" >}}



##### Previous revisions

{{< gallery class="content-gallery" >}}
  {{< img src="/assets/website-v2-spa-contact.png" caption="Release 2">}}
  {{< img src="/assets/website-v1-under-construction.png" caption="Initial announcement site">}}
{{< /gallery >}}