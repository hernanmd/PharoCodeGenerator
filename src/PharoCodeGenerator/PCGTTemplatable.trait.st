Trait {
	#name : 'PCGTTemplatable',
	#category : 'PharoCodeGenerator-Traits',
	#package : 'PharoCodeGenerator',
	#tag : 'Traits'
}

{ #category : 'parameters-substitution' }
PCGTTemplatable >> substituteParametersWith: anObject [
	^ PCGStaticParametersReplacer new
		context: anObject asDictionary;
		visit: self
]
