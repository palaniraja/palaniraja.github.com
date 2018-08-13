---
title: 'Merging multiple MP4 videos with FFMPEG'
date: 2018-06-26T09:16:00.000-07:00
draft: false
tags : [Videos, merge videos, bash script, ffmpeg, Tutorials, command line]
categories: [projects, scripts]
---

I have a collection of video tutorials split into multiple sections and multiple clips in each section. I wanted to merge the files to one, so I can upload and download from services like Google Drive & Dropbox.  
  
I wanted to merge all the clips to one .mp4 file. And also I want to keep the sections and topics for easy viewing later.  
  
After few searches, I could not find one as I like, so I wrote one using [ffmpeg](https://ffmpeg.org/).  
  
[Github](https://gist.github.com/palaniraja/d14ba9ac49019526e0774b28e2d71b16) - [merge-mp4.sh](https://gist.github.com/palaniraja/d14ba9ac49019526e0774b28e2d71b16)  


#### Before:

![](/assets/MP4-merge-chapter---before.png)

  

#### After:

![](/assets/MP4-merge-chapter---after.png)

  
You will see two output files, one with "-meta.mp4" is the one with chapter information.  

#### Output file with chapters:

![](/assets/MP4-merge-chapter---chapters.png)

#### Script: `merge-mp4.sh`

<!-- {{< noscript url="https://gist.github.com/palaniraja/d14ba9ac49019526e0774b28e2d71b16" >}} -->

```
#!/bin/bash

## Script to merge all mp4 videos in current directory (recursively 2 levels)
## And update chapter marks to retain the folder/filename

## Script for merging videos


filename=`basename pwd`
current=`pwd`
bname=`basename "$current"`
find . -maxdepth 2 -iname '*.mp4' | xargs -L 1 echo | awk '{printf "file \x27%s\x27\n", $0}' >> list.txt
find . -maxdepth 2 -iname '*.mp4' | xargs -L 1 echo | awk '{print $0}' >> files.txt
echo -n "Merging the files"
ffmpeg -f concat -safe 0 -i list.txt -c copy "$bname.mp4" -v quiet
echo "..........[ DONE ]"

## extract meta
# ffmpeg -i all.mp4 -f ffmetadata metafile
metafile="metadata.txt"
echo -n "Extracting meta data"
ffmpeg -i "$bname.mp4" -f ffmetadata $metafile -v quiet
echo "..........[ DONE ]"

## chapter marks
#TODO: (‘=’, ‘;’, ‘#’, ‘\’) to be escaped
ts=0
echo -n "Identifying chapters"
cat files.txt | while read file
do
    ds=`ffprobe -v quiet -of csv=p=0 -show_entries format=duration "$file"`
    # echo "$ds"
    echo "[CHAPTER]" >> $metafile
    echo "TIMEBASE=1/1" >> $metafile
    echo "START=$ts" >> $metafile
    ts=`echo $ts + $ds | bc`
    echo "END=$ts" >> $metafile
    echo "TITLE=$file" >> $metafile
    
done
echo "..........[ DONE ]"
## update meta with chaptermarks

echo -n "Adding chapter meta "

ffmpeg -i "$bname.mp4" -i $metafile -map_metadata 1 -codec copy "$bname-meta.mp4" -v quiet
echo "..........[ DONE ]"

## cleanup
echo -n "Cleaning up"

rm files.txt list.txt $metafile

echo "..........[ DONE ]"

echo "Job Completed."

```

{{< mygist url="https://gist.github.com/palaniraja/d14ba9ac49019526e0774b28e2d71b16" >}}
