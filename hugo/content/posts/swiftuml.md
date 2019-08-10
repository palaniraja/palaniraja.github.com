---
title: "SwiftUML - Generate PlantUML class diagram from Swift source code"
date: 2019-08-10T14:56:55-07:00
draft: true
---

At any point in time, I will always have few project ideas around source code parsing, building a tokenizer or creating a custom DSL and syntaxes. 

During a conversation at work I remembered ancient xcode feature [Class Model](https://permadi.com/2009/06/xcode-tips/). Wondered what happen to it? is there any way to generate class diagram from swift source code now. Unfortunately I found there is no official support for such feature. The good old feature seems to be lost in xcode 3 to 4 transition I suppose.


There have been few articles and tweets pass by mentioning [SourceKit](https://github.com/apple/swift/tree/master/tools/SourceKit), [SourceKitten](https://github.com/jpsim/SourceKitten). I wanted to try to use them to see if I could create one. In the process I figured some awesome opensource tools like [swift-auto-diagram](https://github.com/yoshimkd/swift-auto-diagram) and [SwiftToPlantUMLConverter](https://github.com/radekcieciwa/SwiftToPlantUMLConverter) which already does this job. 

Unfortunately swift-auto-diagram written in Ruby and the export is an html wit [viz.js](https://github.com/almende/vis), and SwiftToPlantUML does almost what I want a [plantuml](http://plantuml.com/) output, but written in Rust. 

Long weekend without a car and my failed photoshoot execution on Jul 4th fireworks at SFO, I had to go back to my comfort activity, code. Surprisingly with the help of [sourcekitten](https://github.com/jpsim/SourceKitten), [jq](https://github.com/stedolan/jq) and [plantuml](http://plantuml.com/) I kind of completed initial version of the script, lot faster than I estimate. Being a developer it does not happen that often. 

It is not much at the moment, as you can only create modal from single file, it serve my purpose now. As usual I have lot of ideas to make this awesome.

### Swift UML 

* [swiftuml](https://github.com/palaniraja/swiftuml)

{{< img src="/assets/swiftuml-screenshot.png"  caption="sample generated plantuml diagram from swift source" >}}



I did not realise how much thought went into Swift tools by creators, I honestly doubt if any of this are a suggestion or mandate from Apple Management. I hope with SwiftUI and Swift, Microsoft, IntelliJ or Vim beat Apple on having best class editors* for Apple software development. 

I definitely see this as Interface builder is going away with SwiftUI and [SourceKit-LSP](https://github.com/apple/sourcekit-lsp) we can have an editor which we can hack.

\* - I have nothing against xcode or team but I hate Apple they keep locking down brilliant tools like [Alcatraz](https://github.com/alcatraz/Alcatraz)


And thanks to [swift-auto-diagram](https://github.com/yoshimkd/swift-auto-diagram) and [SwiftToPlantUMLConverter](https://github.com/radekcieciwa/SwiftToPlantUMLConverter) for open-sourcing their implemenation to inspire this project.