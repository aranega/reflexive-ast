Extension { #name : #Boolean }

{ #category : #'*ReflexiveAST-API' }
Boolean >> asAST [ 
	^ RABoolean new literalValue: self
]
