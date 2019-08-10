"
I convert a PCG AST as a Pharo RB AST.
"
Class {
	#name : #PCGStaticConverterToRBAST,
	#superclass : #PCGStaticConverterToRealAST,
	#category : #'PharoCodeGenerator-RB'
}

{ #category : #'methods generation' }
PCGStaticConverterToRBAST class >> regenerateFactoryMethods [
	<script>
	PCGProgramNode allSubclasses \ {PCGTemplateParameter}
		select: [ :c | c subclasses isEmpty ]
		thenDo: [ :class |
			|selectorKeywords arguments|
			selectorKeywords := self buildFactoryMethodSelectorKeywordsFor: class.
			arguments := class instanceVariablesForRealAST collect: [ :instVarName |
				instVarName asPCGArgument ].
			(PCGMethodNode
				selectorKeywords: selectorKeywords
				arguments: arguments)
				bodyBlock: [ :body | 
					| cascade |
					cascade := PCGCascadeNode target: class classForRealAST asPCG receiveNew.
					(class classForRealAST inheritsFrom: RBVariableNode)
						ifTrue: [ cascade receiveMessage: #start: with: 0 asPCG ].
					class instanceVariablesForRealAST
						do: [ :instVarName | 
							cascade receiveMessage: instVarName asMutator with: instVarName asPCGArgument ].
					cascade receiveYourself.
					body << cascade returnIt ];
				protocol: 'factory';
				installOn: self ]
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createArgumentNodeWithName: name [
	<generated>
	^ RBArgumentNode new
		start: 0;
		name: name;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createArrayNodeWithStatements: statements [
	<generated>
	^ RBArrayNode new
		statements: statements;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createAssignmentNodeWithVariable: variable value: value [
	<generated>
	^ RBAssignmentNode new
		variable: variable;
		value: value;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createBlockNodeWithArguments: arguments body: body [
	<generated>
	^ RBBlockNode new
		arguments: arguments;
		body: body;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createCascadeNodeWithMessages: messages [
	<generated>
	^ RBCascadeNode new
		messages: messages;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createGlobalNodeWithName: name [
	<generated>
	^ RBGlobalNode new
		start: 0;
		name: name;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createInstanceVariableNodeWithName: name [
	<generated>
	^ RBInstanceVariableNode new
		start: 0;
		name: name;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createLiteralArrayNodeWithContents: contents [
	<generated>
	^ RBLiteralArrayNode new
		contents: contents;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createLiteralValueNodeWithValue: value [
	<generated>
	^ RBLiteralValueNode new
		value: value;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createMessageNodeWithReceiver: receiver selector: selector arguments: arguments [
	<generated>
	^ RBMessageNode new
		receiver: receiver;
		selector: selector;
		arguments: arguments;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createMethodNodeWithSelector: selector body: body arguments: arguments pragmas: pragmas [
	<generated>
	^ RBMethodNode new
		selector: selector;
		body: body;
		arguments: arguments;
		pragmas: pragmas;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createPragmaNodeWithSelector: selector arguments: arguments [
	<generated>
	^ RBPragmaNode new
		selector: selector;
		arguments: arguments;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createReturnNodeWithValue: value [
	<generated>
	^ RBReturnNode new
		value: value;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createSelfNodeWithName: name [
	<generated>
	^ RBSelfNode new
		start: 0;
		name: name;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createSequenceNodeWithStatements: statements temporaries: temporaries [
	<generated>
	^ RBSequenceNode new
		statements: statements;
		temporaries: temporaries;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createSuperNodeWithName: name [
	<generated>
	^ RBSuperNode new
		start: 0;
		name: name;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createTemporaryNodeWithName: name [
	<generated>
	^ RBTemporaryNode new
		start: 0;
		name: name;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createThisContextNodeWithName: name [
	<generated>
	^ RBThisContextNode new
		start: 0;
		name: name;
		yourself
]