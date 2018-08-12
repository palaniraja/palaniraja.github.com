---
title: 'Play YouTube with FLV player of your choice'
date: Thu, 25 Oct 2007 09:34:43 +0000
draft: false
tags: [general, PHP, tools, YouTube]
---
**Not working anymore, but you are free to explore the code. Updates are welcome.**

I have completed alternative way to view YouTube videos with FLV player of your choice (JW FLV player in this case). The flv files will not be download to the server, it streams directly from YouTube . 

![assets/alt-utube1.jpg](/assets/alt-utube1.jpg) 

[Download Source](http://prjx.googlecode.com/files/alt-utube.v2.zip) ** Update:** I have updated the script for 2 reasons

1.  Youtube deny if you call the url with **file\_get\_contents()** which is replaced with a curl function. So it needs curl now.
2.  Youtube added more http headers and now the index for direct download link is **8** earlier it was **4**.

I will update the script soon with the following features

*   No need of **allow\_url\_fopen = on** in **php.ini**
*   **Curl** dependency to be removed.