Extension { #name : #Array }

{ #category : #'*ReflexiveAST-API' }
Array >> asAST [ 
	^ RAArray new literalValue: self
]
