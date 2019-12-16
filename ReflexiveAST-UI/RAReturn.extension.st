Extension { #name : #RAReturn }

{ #category : #'*ReflexiveAST-UI' }
RAReturn >> display [
	^ '^ {1}' format: { expression display }
]
