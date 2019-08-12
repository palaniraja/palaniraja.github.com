---
title: "SwiftUML - Generate PlantUML class diagram from Swift source code"
date: 2019-08-10T14:56:55-07:00
draft: false
---

At any point in time, I will always have few project ideas around source code parsing, building a tokenizer or creating a custom DSL and syntaxes. 

During a conversation at work I remembered ancient xcode feature [Class Model](https://permadi.com/2009/06/xcode-tips/). Wondered what happen to it? is there a way to generate class diagram from swift source code now. Unfortunately I found there is no official support for such feature. The good old feature seems to be lost in xcode 3 to 4 transition I suppose.


From the past, I remembered there have been few articles and tweets pass by mentioning [SourceKit](https://github.com/apple/swift/tree/master/tools/SourceKit), [SourceKitten](https://github.com/jpsim/SourceKitten). I thought to try them to see if I could create one. In the process I figured some awesome opensource tools like [swift-auto-diagram](https://github.com/yoshimkd/swift-auto-diagram) and [SwiftToPlantUMLConverter](https://github.com/radekcieciwa/SwiftToPlantUMLConverter) which already does this job. 

Unfortunately swift-auto-diagram written in Ruby and the export is an html with [viz.js](https://github.com/almende/vis) not an image. And SwiftToPlantUML does almost what I want a [plantuml](http://plantuml.com/) output, but written in Rust. I am not familiar with both the languages. My initial thought was, to take json output from swift-auto-diagram to do create plantuml version. But, I prefer Apple style short method signatures than the auto-diagram version of full string. In addition I noticed they use regex, though it works now, I've tested with latest xcode 10/Swift 5.0.1, it may fail if Swift go through another horrible syntax updates.

And comes this long weekend without a car and my failed photoshoot execution on Jul 4th fireworks at SFO, I had to go back to my comfort activity, code. Surprisingly with the help of [sourcekitten](https://github.com/jpsim/SourceKitten), [jq](https://github.com/stedolan/jq) and [plantuml](http://plantuml.com/) I kind of completed initial version of the script, lot faster than I estimated. Being a developer it does not happen that often. 

It is not much at the moment, as you can only create modal from single file, it serve my purpose for now. As usual I have lot of ideas to make this awesome if time permits.

### Swift UML 

* [swiftuml](https://github.com/palaniraja/swiftuml)

{{< img src="/assets/swiftuml-screenshot.png"  caption="sample generated plantuml diagram from swift source" >}}


I did not realise how much thought went into Swift tools by creators. It doesn't feel like usual tokenizer or lexer activity. It was as simple as parsing API responses. I honestly doubt if any of this are a suggestion or mandate from Apple management. 

I hope with SwiftUI and Swift, [Microsoft](https://code.visualstudio.com/), [IntelliJ](https://www.jetbrains.com/objc/) or [Vim](https://www.vim.org/) beats xcode on having best class editors* for Apple software development. I wish this is the case, as Interface builder is going away with [SwiftUI](https://developer.apple.com/xcode/swiftui/) and [SourceKit-LSP](https://github.com/apple/sourcekit-lsp) we can have a better and light weight editor which we can hack.

\* - I have nothing against xcode team but I hate Apple they keep locking down brilliant tools like [Alcatraz](https://github.com/alcatraz/Alcatraz) [xvim](https://github.com/XVimProject/XVim)


And my thanks to [swift-auto-diagram](https://github.com/yoshimkd/swift-auto-diagram) and [SwiftToPlantUMLConverter](https://github.com/radekcieciwa/SwiftToPlantUMLConverter) for open-sourcing their implemenation to inspire this project.
