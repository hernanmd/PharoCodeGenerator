Class {
	#name : 'PCGPackageTagDescription',
	#superclass : 'PCGAbstractBehaviorsContainer',
	#category : 'PharoCodeGenerator-MetaModel',
	#package : 'PharoCodeGenerator',
	#tag : 'MetaModel'
}

{ #category : 'installing' }
PCGPackageTagDescription >> installOn: aPackage [
	aPackage installPCGPackageTagDescription: self
]
