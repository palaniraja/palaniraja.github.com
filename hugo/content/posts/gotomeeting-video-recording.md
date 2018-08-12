---
title: 'GotoMeeting Video recording (G2M3 codec for Mac)'
date: 2010-10-13T11:32:00.000-07:00
draft: false
tags : [experience, ideas, My Software Toolbox, Snow Leopard, GotoMeeting, OSX86, info, solution, Tips]
---

If you use GotoMeeting to record video of the shared screen, make sure that you DO NOT use G2M3 codec. It does a great job in compressing the size of the video but it is not compatible with OSX or any OS other than Windows.

I recently received a client application screencast wmv encoded with G2M3 codec. Had hard time figuring out the way to play it on Mac OSX. There is no codec for mac and normal work around you see in the first page of Google doesn't help either.  
  
I tried [Handbrake](http://handbrake.fr "Handbrake site link"), [VisualHub](http://www.visualhub.org/ "VisualHub site link"), [FFMPEGx](http://www.ffmpegx.com "FFMpegx") and [MPEG Streamclip](http://www.squared5.com "MPEG ") for Mac without any luck.

Finally [MS Expression Encoder](http://www.microsoft.com/expression/products/overview.aspx?key=web "Expression Encoder") to rescue that again depends on .net framework 4 it converts the video that can be played on Mac with [VLC player](http://www.videolan.org/vlc/ "VLC Player") but it doesn't allow me to forward the video.

I can't export the audio of the file to MP3 even the almighty [Super](http://www.erightsoft.com/SUPER.html "Super video converter") failed.

**Take away**: Never encode in G2M3. If you do then, please use Expression Encoder to convert to wmv that can be played in other OS (limited support but at-least you can view).

**P.S:** This post doesn't fit in a tweet, and take away alone does not convey it all.