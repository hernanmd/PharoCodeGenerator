"
I provide the DSL for nodes that can be returned by a method.
"
Trait {
	#name : 'PCGTReturnable',
	#category : 'PharoCodeGenerator-Traits',
	#package : 'PharoCodeGenerator',
	#tag : 'Traits'
}

{ #category : 'dsl' }
PCGTReturnable >> returnIt [
	^ PCGReturnNode value: self
]
