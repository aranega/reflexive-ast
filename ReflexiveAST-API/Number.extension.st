Extension { #name : #Number }

{ #category : #'*ReflexiveAST-API' }
Number >> asAST [ 
	^ RANumber new literalValue: self
]
