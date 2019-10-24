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
		into: [ :sum :each | sum , aString , (each acceptVisitor: self) asString ]
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitArgumentUse: argumentUse [
	^ argumentUse reference name
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitAssignment: assignment [
	^ '{1} := {2}' format: {assignment variable reference name. assignment expression acceptVisitor: self}
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitBinaryMessageSend: binaryMessageSend [
	^ '{1} {2}' format: { (binaryMessageSend receiver acceptVisitor: self) asString.
	self collectionAsString: binaryMessageSend keywords }
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
