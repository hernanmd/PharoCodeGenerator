Extension { #name : 'Package' }

{ #category : '*PharoCodeGenerator' }
Package >> installPCGClass: aPCGClassDescription [

	| classInstalled |
	classInstalled := aPCGClassDescription superclassName evaluate
		                  classInstaller make: [ :builder |
		                  builder
			                  superclass:
				                  aPCGClassDescription superclassName evaluate;
			                  name: aPCGClassDescription name evaluate;
			                  slots:
				                  aPCGClassDescription slotsDeclaration evaluate;
			                  sharedVariables:
				                  aPCGClassDescription classVariables;
			                  traitComposition:
				                  aPCGClassDescription traitCompositionUsed
					                  evaluate;
			                  package: self name;
			                  environment:
				                  aPCGClassDescription superclassName evaluate
					                  environment ].
	aPCGClassDescription methods do: [ :method |
		method installOn: classInstalled ].
	aPCGClassDescription runInstallationHooksFor: classInstalled.
	^ classInstalled
]

{ #category : '*PharoCodeGenerator' }
Package >> installPCGExtensionMethod: aPCGExtensionMethod [
	| installedMethod |
	installedMethod := aPCGExtensionMethod methodNode
								protocol: ('*' , self name);
								installOn: aPCGExtensionMethod installationTarget evaluate.
		
	aPCGExtensionMethod runInstallationHooksFor: installedMethod.
	
	^ installedMethod
]

{ #category : '*PharoCodeGenerator' }
Package >> installPCGPackageTagDescription: aPCGPackageTagDescription [
	| tag |
	(self includesClassTagNamed: aPCGPackageTagDescription name evaluate)
		ifTrue: [ self halt: #TODO "Raise notification" ].

	tag := self addClassTag: aPCGPackageTagDescription name evaluate.
	
	aPCGPackageTagDescription behaviors do: [ :b |
		b installOn: tag ].
	
	aPCGPackageTagDescription runInstallationHooksFor: tag.
	
	^ tag
]

{ #category : '*PharoCodeGenerator' }
Package >> installPCGTrait: aPCGTraitDescription [
	| traitInstalled |
	traitInstalled := Trait
		named: aPCGTraitDescription name evaluate
		uses: aPCGTraitDescription traitCompositionUsed evaluate
		slots: aPCGTraitDescription slotsDeclaration evaluate
		category: self name.
		
	aPCGTraitDescription methods do: [ :method |
		method installOn: traitInstalled ].
	
	aPCGTraitDescription runInstallationHooksFor: traitInstalled.
	
	^ traitInstalled.
]
