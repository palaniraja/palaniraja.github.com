---
title: "How to add syntax highlighting to any source code in Bitbucket"
date: 2023-04-02T21:55:00-07:00
draft: false
tags: [kotlin, bitbucket, monaco, script, bookmarklet, syntax-highlighting, editor]
categories: [kotlin, monaco, scripts]
---

My work Bitbucket doesn't support proper syntax highlighting for `kotlin` for unknown reasons. A quick search led me to this [Atlassian public jira](https://jira.atlassian.com/browse/BCLOUD-16513) ticket from 2018.

They closed the ticket now - _like last week_! But the issue they linked is a ticket that adds syntax highlight to diffs not for viewing source files. Anyway, I still do not see syntax highlights on our repo for `.kt` files. 

And it is frustrating to stop and share multiple windows during Microsoft Teams/Slack sessions. I prefer to share one browser window so I can simply open another repo in another tab instead of doing a _stop and start sharing_ routine after switching it to a new repo with Android Studio. Also I do need to wait for Gradle sync or resolving errors.


I initially thought I could use [highlight.js](https://github.com/highlightjs/highlight.js) to add syntax highlighting. But digging a little deeper I found that Bitbucket uses [Monaco-editor](https://github.com/microsoft/monaco-editor) as their editor/viewer for source code.

After spending some time reviewing `Monaco` documentation and [monaco](https://microsoft.github.io/monaco-editor/playground.html) / [monarch](https://microsoft.github.io/monaco-editor/monarch.html) playgrounds. I was able to add syntax-highlighting to `kotlin` relatively easily. Fortunately, I was able to find [kotlin syntax in monaco-repo](https://github.com/microsoft/monaco-editor/blob/main/src/basic-languages/kotlin/kotlin.ts) and most of my time spent on figuring out what goes into `setMonarchTokensProvider`

Now, I have a bookmarklet to add kotlin syntax highlight with one click.

The same can be used for adding support to any custom language that may not be supported by your Bitbucket instance.

Here is the before and after. 

_I pasted the screengrab of the post syntax highlight on the screenshot for easier comparison. The below script doesn't do split screen :-)_

![Before & After applying syntax highlighting to a kotlin source code](/assets/kotlin-syntax-highlight-to-cloud-hosted-bitbucket.png)


### JS

```
// source: https://github.com/microsoft/monaco-editor/blob/main/src/basic-languages/kotlin/kotlin.ts

monaco.languages.register({ id: "kotlin" });

monaco.languages.setLanguageConfiguration("kotlin", {
	// the default separators except `@$`
	wordPattern: /(-?\d*\.\d\w*)|([^\`\~\!\#\%\^\&\*\(\)\-\=\+\[\{\]\}\\\|\;\:\'\"\,\.\<\>\/\?\s]+)/g,
	comments: {
		lineComment: '//',
		blockComment: ['/*', '*/']
	},
	brackets: [
		['{', '}'],
		['[', ']'],
		['(', ')']
	],
	autoClosingPairs: [
		{ open: '{', close: '}' },
		{ open: '[', close: ']' },
		{ open: '(', close: ')' },
		{ open: '"', close: '"' },
		{ open: "'", close: "'" }
	],
	surroundingPairs: [
		{ open: '{', close: '}' },
		{ open: '[', close: ']' },
		{ open: '(', close: ')' },
		{ open: '"', close: '"' },
		{ open: "'", close: "'" },
		{ open: '<', close: '>' }
	],
	folding: {
		markers: {
			start: new RegExp('^\\s*//\\s*(?:(?:#?region\\b)|(?:<editor-fold\\b))'),
			end: new RegExp('^\\s*//\\s*(?:(?:#?endregion\\b)|(?:</editor-fold>))')
		}
	}
});



monaco.languages.setMonarchTokensProvider("kotlin", {
	defaultToken: '',
	tokenPostfix: '.kt',

	keywords: [
		'as',
		'as?',
		'break',
		'class',
		'continue',
		'do',
		'else',
		'false',
		'for',
		'fun',
		'if',
		'in',
		'!in',
		'interface',
		'is',
		'!is',
		'null',
		'object',
		'package',
		'return',
		'super',
		'this',
		'throw',
		'true',
		'try',
		'typealias',
		'val',
		'var',
		'when',
		'while',
		'by',
		'catch',
		'constructor',
		'delegate',
		'dynamic',
		'field',
		'file',
		'finally',
		'get',
		'import',
		'init',
		'param',
		'property',
		'receiver',
		'set',
		'setparam',
		'where',
		'actual',
		'abstract',
		'annotation',
		'companion',
		'const',
		'crossinline',
		'data',
		'enum',
		'expect',
		'external',
		'final',
		'infix',
		'inline',
		'inner',
		'internal',
		'lateinit',
		'noinline',
		'open',
		'operator',
		'out',
		'override',
		'private',
		'protected',
		'public',
		'reified',
		'sealed',
		'suspend',
		'tailrec',
		'vararg',
		'field',
		'it'
	],

	operators: [
		'+',
		'-',
		'*',
		'/',
		'%',
		'=',
		'+=',
		'-=',
		'*=',
		'/=',
		'%=',
		'++',
		'--',
		'&&',
		'||',
		'!',
		'==',
		'!=',
		'===',
		'!==',
		'>',
		'<',
		'<=',
		'>=',
		'[',
		']',
		'!!',
		'?.',
		'?:',
		'::',
		'..',
		':',
		'?',
		'->',
		'@',
		';',
		'$',
		'_'
	],

	// we include these common regular expressions
	symbols: /[=><!~?:&|+\-*\/\^%]+/,
	escapes: /\\(?:[abfnrtv\\"']|x[0-9A-Fa-f]{1,4}|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8})/,
	digits: /\d+(_+\d+)*/,
	octaldigits: /[0-7]+(_+[0-7]+)*/,
	binarydigits: /[0-1]+(_+[0-1]+)*/,
	hexdigits: /[[0-9a-fA-F]+(_+[0-9a-fA-F]+)*/,

	// The main tokenizer for our languages
	tokenizer: {
		root: [
			// class name highlighting
			[/[A-Z][\w\$]*/, 'type.identifier'],

			// identifiers and keywords
			[
				/[a-zA-Z_$][\w$]*/,
				{
					cases: {
						'@keywords': { token: 'keyword.$0' },
						'@default': 'identifier'
					}
				}
			],

			// whitespace
			{ include: '@whitespace' },

			// delimiters and operators
			[/[{}()\[\]]/, '@brackets'],
			[/[<>](?!@symbols)/, '@brackets'],
			[
				/@symbols/,
				{
					cases: {
						'@operators': 'delimiter',
						'@default': ''
					}
				}
			],

			// @ annotations.
			[/@\s*[a-zA-Z_\$][\w\$]*/, 'annotation'],

			// numbers
			[/(@digits)[eE]([\-+]?(@digits))?[fFdD]?/, 'number.float'],
			[/(@digits)\.(@digits)([eE][\-+]?(@digits))?[fFdD]?/, 'number.float'],
			[/0[xX](@hexdigits)[Ll]?/, 'number.hex'],
			[/0(@octaldigits)[Ll]?/, 'number.octal'],
			[/0[bB](@binarydigits)[Ll]?/, 'number.binary'],
			[/(@digits)[fFdD]/, 'number.float'],
			[/(@digits)[lL]?/, 'number'],

			// delimiter: after number because of .\d floats
			[/[;,.]/, 'delimiter'],

			// strings
			[/"([^"\\]|\\.)*$/, 'string.invalid'], // non-teminated string
			[/"""/, 'string', '@multistring'],
			[/"/, 'string', '@string'],

			// characters
			[/'[^\\']'/, 'string'],
			[/(')(@escapes)(')/, ['string', 'string.escape', 'string']],
			[/'/, 'string.invalid']
		],

		whitespace: [
			[/[ \t\r\n]+/, ''],
			[/\/\*\*(?!\/)/, 'comment.doc', '@javadoc'],
			[/\/\*/, 'comment', '@comment'],
			[/\/\/.*$/, 'comment']
		],

		comment: [
			[/[^\/*]+/, 'comment'],
			[/\/\*/, 'comment', '@comment'],
			[/\*\//, 'comment', '@pop'],
			[/[\/*]/, 'comment']
		],
		//Identical copy of comment above, except for the addition of .doc
		javadoc: [
			[/[^\/*]+/, 'comment.doc'],
			[/\/\*/, 'comment.doc', '@push'],
			[/\/\*/, 'comment.doc.invalid'],
			[/\*\//, 'comment.doc', '@pop'],
			[/[\/*]/, 'comment.doc']
		],

		string: [
			[/[^\\"]+/, 'string'],
			[/@escapes/, 'string.escape'],
			[/\\./, 'string.escape.invalid'],
			[/"/, 'string', '@pop']
		],

		multistring: [
			[/[^\\"]+/, 'string'],
			[/@escapes/, 'string.escape'],
			[/\\./, 'string.escape.invalid'],
			[/"""/, 'string', '@pop'],
			[/./, 'string']
		]
	}});


var ed = monaco.editor.getModels()[0]
monaco.editor.setModelLanguage(ed, 'kotlin')
```

{{< mygist url="https://gist.github.com/palaniraja/c987ed0cc23b3cdbfaa329ce69ed888e" >}}

