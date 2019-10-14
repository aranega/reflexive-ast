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
DirtyPrettyPrinter >> visitBinaryMessageSend: binaryMessageSend [
	^ '{1} {2}' format: { (binaryMessageSend receiver acceptVisitor: self) asString.
	self collectionAsString: binaryMessageSend keywords }
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
DirtyPrettyPrinter >> visitMethod: method [
	^ '{1}
| {2} |
{3}'
		format:
			{(self collectionAsString: method keywords).
			(self collectionAsString: method temporaries).
			(self collectionAsString: method statements separatedBy: '
')}
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitTempDefinition: temp [
	^ temp name
]

{ #category : #visiting }
DirtyPrettyPrinter >> visitTempUse: tempUse [
	^ tempUse reference name
]