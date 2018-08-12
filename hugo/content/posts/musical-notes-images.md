---
title: 'Musical notes images'
date: 2017-03-23T22:36:00.002-07:00
draft: false
tags : [sight-reading, free, assets, freebie]
---

For my app [Music-notes](https://github.com/palaniraja/music-notes), I was searching for images of musical notes so I can use them in my flash card feature. Unfortunately, I couldn't found one, hence I spent time to generate  programatically.  
  

### TL;DR

  
Feel free to use the assets the way you want ([MIT](https://tldrlegal.com/license/mit-license))  
  
\* Download [SVG](https://drive.google.com/uc?export=download&id=0B6Gx9mMm8tFsMlE2TUVGQ1k2Rm8)  
  
_Note_: [PNG version](https://github.com/palaniraja/music-notes/tree/master/src/assets) \- are 3x scaled version of SVG.  
  

![](/assets/musicnotes-treble.png)

  

![](/assets/musicnotes-bass.png)

  

  

  

### My workflow to generate SVG

  

I knew about [VexFlow](http://www.vexflow.com/vextab/tutorial.html), as there is always I've some idea which requires this library. As usual I overshot my estimate only to learn, it doesn't have an option to generate notes to a given height & width. 

  

So, I [forked](https://jsfiddle.net/palaniraja/hLdr3gos/4/) their sample to generate each notes. And I resized them using [svg editor](http://editor.method.ac/), I set the height to \`130\` as it seems vertically center to me.

  

Also used [Gapplin](http://gapplin.wolfrosch.com/) to scale and export them to PNG.  
  
  
##### Update - 2018-03-20:  

*   Thank you AllanZp for updating me that `png` files are not part of the archive. Sorry, it took me so long to respond.