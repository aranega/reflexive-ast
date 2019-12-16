Extension { #name : #RAMethod }

{ #category : #'*ReflexiveAST-API' }
RAMethod >> addTemporaryNamed: aName [ 
	^ self addTemporaryNamed: aName position: (temporaries size + 1) 
]

{ #category : #'*ReflexiveAST-API' }
RAMethod >> addTemporaryNamed: aName position: index [
	| searched tmpdef |
	searched := temporaries select: [ :e | e name = aName ].
	searched ifNotEmpty: [ ^ searched first ].
	tmpdef := RATempDefinition new name: aName.
	temporaries insert: tmpdef at: index.
	^ tmpdef
]

{ #category : #'*ReflexiveAST-API' }
RAMethod >> assign: aName to: anExpression [
	^ self assign: aName to: anExpression position: (statements size + 1)
]

{ #category : #'*ReflexiveAST-API' }
RAMethod >> assign: aName to: anExpression  position: index [
	| assign temp |
	assign := RAAssignment new.
	temp := self addTemporaryNamed: aName.
	assign variable: (RATempUse new reference: temp).
	assign expression: anExpression asAST.
	statements insert: assign at: index. 
	^ assign
]

{ #category : #'*ReflexiveAST-API' }
RAMethod >> isMethod [
	^ true
]

{ #category : #'*ReflexiveAST-API' }
RAMethod >> statement: anExpression [
	statements add: anExpression
]
