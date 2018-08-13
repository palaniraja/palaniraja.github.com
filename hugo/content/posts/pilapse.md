---
title: "Pilapse - Raspberry Pi Camera and Timelapse"
date: 2018-07-28T18:53:05+05:30
draft: false
categories: [projects, scripts]
---

It is a simple python script to capture timelapse with few more addition option than [`raspistill -tl`](https://www.raspberrypi.org/documentation/usage/camera/raspicam/raspistill.md). 

Built-in command usage: `raspistill -t 30000 -tl 2000 -o image%04d.jpg`


I wrote  `pilapse.py` because I need to manage the quality `-q` and `W x H` which `-tl` flag does not support. Along with configurable delay between each pictures and when to stop based on available freespace on disk.

Find my first successful timelapse using this script below. Sorry for the orientation.


{{< youthumb 7X7YW2372Qk >}}


{{< youthumb pzTujxJvKDo >}}


#### Hardware used: 

* Raspberry Pi Zero W 
* Pi Camera module v1.2 (unofficial) 
* Official Pi Zero camera case (white/red) 
* MI - 10000 mAh Battery pack 
* 212 images of 15 sec interval (~53 minutes)


#### Stiching timelapse video: 

Files were later copied to a mac, batch renamed later as

* image0.jpg
* image1.jpg
* ...
* image100.jpg

And used the following command to convert to video

`avconv -r 10 -i image%d.jpg -r 10 -vcodec libx264 -vf scale=1440:1080 timelapse.mp4`

**Note:** While renaming be aware of natural order sorting ([ref](http://hints.macworld.com/article.php?story=20030724161328982)). Finder batch rename messed few times, so always check the images are in correct sequence.


#### Script: `pilapse.py` 

<!-- {{< noscript url="https://gist.github.com/palaniraja/a0ee100dec5a7dbd6a704c51adb96ba2" >}} -->

<!-- {{< gist palaniraja a0ee100dec5a7dbd6a704c51adb96ba2 >}} -->


```
#!/usr/bin/python
import os
import time
import subprocess
from time import sleep
import random


# Configuration 

sleepDurationInSeconds = 15
checkDiskSpaceEveryImage = 20

rand = random.randint(0,10000)
# "echo \"SEQ-$RANDOM-$(ls | wc -l)-\""
numFiles = subprocess.check_output("echo $(ls | wc -l)", shell=True)


randPrefix = "SEQ-"+str(rand)+"-"+str(numFiles).strip()


imgSeq = 0
shouldAbort = False

print "Timelapse started. Capture image every "+str(sleepDurationInSeconds)+" sec. Check Free Space every "+str(checkDiskSpaceEveryImage)+" images."

while (shouldAbort != True):
    # Every x seconds
    sleep(sleepDurationInSeconds)
    ts = time.strftime("%Y%m%d%H%M%S")
    imgName = randPrefix+"-"+str(imgSeq)+"-"+ts
    print imgName

    os.system("raspistill -t 2000 -n -q 100 -vf -hf -w 1440 -h 1080 -o "+imgName+".jpg")

    imgSeq += 1
    # Quit after x images
    # if (imgSeq > 10):
    #     shouldAbort = True


    # Check freespace every x seconds
    if (imgSeq % checkDiskSpaceEveryImage == 0):
        dfOut = subprocess.check_output("df | grep root| awk '{print $4}'", shell=True)
        freespace = int(dfOut.strip())
        # less than 1G
        if (freespace < 1000000):
            print "Low on space, exiting timelapse"
            shouldAbort = True

print "Timelapse completed."
```

{{< mygist url="https://gist.github.com/palaniraja/a0ee100dec5a7dbd6a704c51adb96ba2" >}}