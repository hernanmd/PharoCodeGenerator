"
I am used to type nodes of the AST that can appear as a statement.
"
Trait {
	#name : 'PCGTStatement',
	#category : 'PharoCodeGenerator-Traits',
	#package : 'PharoCodeGenerator',
	#tag : 'Traits'
}

{ #category : 'dsl' }
PCGTStatement >> inBlock [
	^ PCGBlockNode bodyBlock: [ :body | body << self ]
]
