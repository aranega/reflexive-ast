Extension { #name : #String }

{ #category : #'*ReflexiveAST-API' }
String >> asAST [ 
	^ RAString new literalValue: self
]
