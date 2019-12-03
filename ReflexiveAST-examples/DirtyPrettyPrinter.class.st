Class {
	#name : #DirtyPrettyPrinter,
	#superclass : #RABaseVisitor,
	#category : #'ReflexiveAST-examples'
}

{ #category : #visiting }
DirtyPrettyPrinter >> collectionAsString: aCollection [
	^ self collectionAsString: aCollection separatedBy: ' '
]

{ #category : #visiting }
DirtyPrettyPrinter >> collectionAsString: aCollection separatedBy: aString [
	^ aCollection
		inject: ''
		into: [ :sum :each | sum, (sum isEmpty ifTrue: [''] ifFalse: [aString]), (each acceptVisitor: self) asString ]
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitArgumentDefinition: argDef [
	^ argDef name
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitArgumentUse: argumentUse [
	^ argumentUse reference name
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitArray: anArray [
	^ anArray literalValue 
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitAssignment: assignment [
	^ '{1} := {2}' format: {assignment variable reference name. assignment expression acceptVisitor: self}
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitBinaryMessageSend: binaryMessageSend [
	^ '{1} {2} ({3})' format: { (binaryMessageSend receiver acceptVisitor: self) asString.
	binaryMessageSend operator asString.
	(binaryMessageSend keywords at: 1) expression acceptVisitor: self }
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitBlock: block [
	| args temps |
	args := block hasArguments
		ifTrue: [ (block arguments
				inject: ''
				into: [ :sum :each | sum , ' :' , (each acceptVisitor: self) asString ])
				, ' | ' ]
		ifFalse: [ '' ].
	temps := block hasTemps
		ifTrue: [ '| ' , (self collectionAsString: block temporaries) , ' |' ]
		ifFalse: [ '' ].
	^ '[{1}{2}
	{3}			
]'
		format:
			{args.
			temps.
			(self
				collectionAsString: block statements
				separatedBy:
					'.
	')}
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitInstVarUse: instVarUse [
	^ instVarUse reference name
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitKeyword: keyword [
	^ '{1} {2}' format: { (keyword name) asString.
	(keyword expression acceptVisitor: self) asString}
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitKeywordDefinition: keywordDefinition [
	keywordDefinition parent hasArguments ifFalse: [ ^ keywordDefinition name ]. 
	^ keywordDefinition name, ' ', keywordDefinition argument name
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitMessageSend: message [
	^ (message receiver acceptVisitor: self) asString
		,
			(message keywords
				inject: ''
				into: [ :sum :each | 
					sum , ' ' , each name , ' '
						,
							(each hasExpression
								ifTrue: [ '(' , (each expression acceptVisitor: self) asString , ')' ]
								ifFalse: [ '' ]) ])
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitMethod: method [
	^ '{1}
| {2} |
{3}'
		format:
			{(self collectionAsString: method keywords).
			(self collectionAsString: method temporaries).
			(self collectionAsString: method statements separatedBy: '.
')}
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitNumber: literal [
	^ literal literalValue
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitPseudoVariable: pseudoVariable [
	^ pseudoVariable name
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitReturn: return [
	^ '^ ', (return expression acceptVisitor: self) asString
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitTempDefinition: temp [
	^ temp name
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitTempUse: tempUse [
	^ tempUse reference name
]
