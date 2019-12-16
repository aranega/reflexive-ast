Extension { #name : #RAMessageSend }

{ #category : #'*ReflexiveAST-UI' }
RAMessageSend >> display [
	^ '{1} {2}' format: {receiver display. self selector}
]
