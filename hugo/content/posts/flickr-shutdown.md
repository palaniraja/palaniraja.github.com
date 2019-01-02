---
title: "Flickr - How not to design backup userdata when shutting down your service"
date: 2019-01-01T16:22:22+05:30
draft: false
tags : [Best practices, Flickr, Yahoo, PSA, Architecture, Design]
---


> **Happy New Year - 2019**

<hr />

It is always easy to find fault than fixing. So this isn't very hard to start this year blogging write a rant. I wish I'd gone through this earlier; if so, atleast I could have asked Flickr to update minimal fixes. Anyway, I would like to record it so we don't repeat the same mistakes.

### End of Flickr free-tier


[Flickr announced](https://www.theverge.com/2018/11/1/18051950/flickr-1000-photo-limit-free-accounts-changes-pro-subscription-smugmug) that they are going to end 1-TB free-tier storage for their users on [Nov'18](https://www.theverge.com/2018/11/1/18051950/flickr-1000-photo-limit-free-accounts-changes-pro-subscription-smugmug) starting from Jan 7, 2019. 

There was only one valid reason to keep an Yahoo account after years of hacking and their weak security policies to handover users' data willy-nilly. I was using it to keep a backup of my photos in addition to [Google Photos](https://www.google.com/photos/about/), as Flickr was the only service which keeps original image in Free-tier. Also, I always have ideas for a project or two around Flickr API. Remember the good old Web 2.0 days, with open API's? aww! Golden age of web development.

So as usual, I wasn't taking any action to download the images, as I am 100% certain that I have multiple copies of my ~10GB images in external HDD's. But as the end date is getting near, I'm nervous that _what if_ I don't have some images I uploaded to Flickr. And it is also showing up regularly in my [Org file](https://orgmode.org/), as a pending activity with deadline.

Yesterday, I decided to download the files, I noticied the user experience is aweful and ease of exports for users were never considered by Flickr team. Given that, I always had high respect to Yahoo web-dev team, this is a huge disappointment for me. 

Reason for my love/nostalgic towards Yahoo webdevs is, I learned a lot in my early software professional career from languages/books/frameworks/tutorials by former Yahoo giants like  [Rasmus Lerdorf](https://en.wikipedia.org/wiki/Rasmus_Lerdorf), [Douglas Crockford](https://en.wikipedia.org/wiki/Douglas_Crockford), [Nicholas C. Zakas](https://github.com/nzakas), YUI talks/theater to name a few.  

<hr />  

### Enough history for a rant, what is the problem?

Here are the issues I noticed when I tried to download my ~50 albums. 

#### 1. No way to download multiple albums

{{< img src="/assets/flickr-shutdown/flickr-albums.png"  caption="Albums - Download request on hover" >}}

Why would you not let the user download multiple albums as single download? I found few albums in my current HDD, so I don't want to re-download it again part of downloads. I ended up downloading _almost all_ because of several reasons listed in that and you know that lingering thought _what if?_

#### 2. API access via 3rd-party is not working anymore

{{< img src="/assets/flickr-shutdown/flickr-api-error.png"  caption="API- Access Denied" >}}

Since I could not find the option to download multiple album as single request, I wanted to try to use any opensource scripts to do each album via any script. Unfortunately, none of the recently updated python scripts I could find in Github were working. 

The API to get accessToken is throwing 403, even though they let you create new API screen and key. I've tried few nodejs project as well, different auth offered by their API: OAuth, Web, Native etc., no luck.

#### 3. Download requests (notifications, messages) doesn't include album names

{{< img src="/assets/flickr-shutdown/flickr-message-reqests.png"  caption="Notification lists" >}}

{{< img src="/assets/flickr-shutdown/flickr-message.png"  caption="Notification doesn't include Album name" >}}


Download action is not immediate, understandably so. But it took so much time to offer download for Albums with 1000+ images. I assume, it is due to high traffic of users like myself. 

But the _Flickr mail_ (mind you it is not your email, it is messages/notifications within Flickr) doesn't include the Album names, so I received messages like "_Your zip file of 669 items is ready to download_" with links. The number is sum of Photos and Videos from the Album you requested. 

Good luck if you have multiple albums with same media count. I had couple, and I ended up downloaded wrong archives atleast 3 times.


#### 4. Album are archived for download as a multi-part zips

{{< img src="/assets/flickr-shutdown/flickr-message.png"  caption="Notification doesn't include Album name" >}}

{{< img src="/assets/flickr-shutdown/flickr-unarchived-zip.png"  caption="Multi-part zips with no batch archiving and no album name" >}}

Albums downloads are multi-part archives of 4GB files. Unfortunately, these are not like continous archives which starts at file 1 and unzip and merge all zip files automatically like Good Ol' Days. Each archives are expected to be un-archived seperately by user and merge. 

I didn't notice this until I tried to verify the image counts from downloaded albums. 

#### 5. Even the downloads doesn't have the album name

{{< img src="/assets/flickr-shutdown/flickr-unarchived-zip-2.png"  caption="Multi-part zips with no batch archiving and no album name" >}}

The album downloads are with name {SOME_DATE}{SOME_BASE64_LOOKING_STRING}, no sign of Album names. It is bad, if you had images uploaded to multiple albums. It was hard me or any user for that matter, to be sure to map the downloads to the appropriate albums once you download. Note, the only reason I took this activity is just to be _sure_, and Flickr has no intention to be helpful.

#### 6. No option to delete the "Auto Upload" album - created default by Flickr mobile app

{{< img src="/assets/flickr-shutdown/flickr-no-del-autoupload.png"  caption="No delete option for Auto Upload album" >}}

This is something I can't figure out a reason why, from an implementation point of view. If you expect the mobile apps to push media to a certain folder/album, they can always create one before assigning the media on first payload server side, without expecting user to have latest version. Since there is no input is required from user e.g., album name, permission etc., Or atleast they should have offered empty album photos if not delete album. 

The reason why I was expecting this feature is, as per their new policy is to retain 1000 images for Free-tier. My "Auto Upload" album has ~4000 images all Private by default by _design_. But, I have around 500-400 images that I'd shared with friends & public, which I wanted to retain. Since I not sure how they are going to count the 1000. I wanted to be sure delete all the Private images from "Auto Upload" and retain shared albums which is well within their new tier. But hey, it is what it is, going to break all the links!

#### 7. Non-standard zip - issue with default archive utility on mac

To add salt to the injury, some part 2 and part 3 zips downloaded are throwing corrupted with default archive utility on mac. I didn't realize as I have deleted multiple part 2 / part 3 4GB files thinking they were all unarchived as part of multi-part unarchiving. But I was wrong, had to re-download all again; I had to use trusty [The Unarchiver](https://theunarchiver.com/) to unzip all files successfully. I wonder if this is something specific to Mac? even if so, I expect them to have a common archive format considering the assumption most of their pro's use Mac.


Anyways, I have downloaded about 40GB atleast twice from flickr bandwidth budget for this month. Credit is where its due, at-least they didn't throttle my downloads neither my archive requests.

--

And again, **Happy New Year** everyone.

:-)



