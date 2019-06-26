---
title: "Script to delete xcode buildconfigurations"
date: 2019-06-25T20:37:01-07:00

tags: [projects, bash, git, script]
categories: [projects, scripts]

---

Yes, you do not need this solution, unless you know for sure you have one too many build configs and it is time consuming to delete one by one. And the $ Trillion/Billion company do not find enginneers to assign multiple edits in scheme/buildconfig/simulator list in xcode UI. 

By the way Apple, I'm only 40 min drive away. Call me maybe ;-)


One of my project has more than 200 schemes (for business reasons). Unfortunately opening project in xcode takes more than 10 mins and it frequently hangs when you want to do anything with UI to select scheme or simulator. Though it kind of works once you choose the scheme, xcode occasionally fireup the fan even on a 2018 i9 MBP with 32G memory.

By having closer look at project.pbxproj I found xcodeproj keeps duplicate of groups, files and indexes per scheme. The `project.pbxprj` itself is about 10 times the size of the file post before deleting the scheme & build config. (that too in plist xml format instead of native plist binary)

The script is not completely automatic, but it will help you to go through each step. It took embarassing amount of time to figureout plistbuddy can't delete a value from the list, it only pops. Anyway, I hope you don't need this script, and it helps you when in need.

E.g., this script take about 15 min on my project. Once done, I don't ever have to worry about xcode freezing. And for entertainment it does update `[DELE] / [SKIP]` in Red and Green against each build config while running, proud of this :-). And I've tested only with iTerm2 should work with terminal too.

{{< img src="/assets/pb.sh.png"  caption="script dry run with steps" >}}

### pb.sh

```

#!/bin/bash

# get these ids by "grep -B 2 buildConfigurations project.pbxproj"
targets=("040030D22004301100C4B676" "0420B3DA1FD1E91B00F66B8C" "042171FE1F7EB27500B3578D" "0421731D1F7EB3EC00B3578D" "04CD5F511FD0D1650053BE87" "3461E09E1A7BF77600B666A1" "3461E0C21A7BF77600B666A1" "A0D180071F46067500E00C0C")

# get these xcodebuild -project YOURPROJ.xcodeproj -list
configsToSkip=("us-debug" "us-debug-free" "us-release" "us-release-free" )


# Un-comment below line for debugging
# set -x


RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
COMMENTCOLOR='\033[0;90m'


plistbuddy=/usr/libexec/plistbuddy
file=project.pbxproj


echo "\n"
echo "${RED}YOU'VE BEEN WARNED:${NC} Xcode buildconfig remover\n\n"

echo "I recommend keep copy of your .xcodeproj file\n\n"

echo "STEPS:\n"

echo "1. Find all build configurations to filter the one you want to keep"
echo "   > ${GREEN}xcodebuild -project YOURPROJ.xcodeproj -list ${COMMENTCOLOR}#copy config list under build configurations. Replace variable \"configsToSkip\" contents with your config list${NC}"
echo "2. Convert the text plist to xml based one"
echo "   >  ${GREEN}/usr/libexec/PlistBuddy -x -c \"Print\" project.pbxproj > project.xml ${COMMENTCOLOR}#duplicate project.xml and rename it as project.pbxproj${NC}"
echo "3. Find keys of \"buildConfigurations\" from your project.pbxproj"
echo "   >  ${GREEN}grep -B 2 buildConfigurations project.pbxproj${NC} ${COMMENTCOLOR}#Replace variable \"targets\" with the \"GUIDS\" keys from the command results${NC}"
echo "4. Comeback after updating variables \"targets\" and \"config2skip\" to run the script"

echo "\n\n"
read -p "YES to continue or any key to abort: " confirm && [[ $confirm == "YES" ]] || exit 1

# echo "user typed YES"

echo "\n${RED}YOU'VE BEEN WARNED!${NC} Good luck\n"



date # for time profiling



for targetId in ${targets[@]}; do
  echo "id: $targetId"
  
  buildConfigurationList=`$plistbuddy -c "Print :objects:$targetId:buildConfigurations" "$file" | sed -e '/Array {/d' -e '/}/d' -e 's/^[ \t]*//'`

  for configurationId in ${buildConfigurationList[@]}; do
      # echo $configurationId
      buildConfig=`$plistbuddy -c "Print :objects:$configurationId:name" "$file"`
      # echo "$configurationId = $buildConfig"
      
      if [[ ${configsToSkip[*]} =~ $buildConfig ]]
      then
        echo "[${GREEN}SKIP${NC}] $configurationId = $buildConfig"
      else
        echo "[${RED}DELE${NC}] $configurationId = $buildConfig"
        $plistbuddy -c "delete :objects:$configurationId" "$file" && sed -i '' "/$configurationId/d" "$file"
      fi

  done
done


date # for time profiling

```


<!-- {{<gist palaniraja 75ae5b7c200c13395fa0ddc0ac818918>}} -->
{{< mygist url="https://gist.github.com/palaniraja/75ae5b7c200c13395fa0ddc0ac818918" >}}
{{<noscript url="https://gist.github.com/palaniraja/75ae5b7c200c13395fa0ddc0ac818918">}}


---

Though I wrote this during Easter'19 weekend and forgot to post, but it took few weekends to figure out the issue.

Note to self: I should start writing any script in python instead of bash. I always think it is simple piping and spend more time in figuring out bash programming nuances.
