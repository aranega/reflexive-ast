Extension { #name : #RAMessageSend }

{ #category : #'*ReflexiveAST-API' }
RAMessageSend >> keyword: keyname expression: expression [
	self
		keyword: keyname
		expression: expression
		position: keywords size + 1
]

{ #category : #'*ReflexiveAST-API' }
RAMessageSend >> keyword: keyname expression: expression position: index [
	| keyword |
	keyword := RAKeyword new
		name: keyname;
		expression: expression asAST.
	keywords insert: keyword at: index
]
