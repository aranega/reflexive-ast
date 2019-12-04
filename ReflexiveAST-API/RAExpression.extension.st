Extension { #name : #RAExpression }

{ #category : #'*ReflexiveAST-API' }
RAExpression >> send: aMessageName [
	| message |
	aMessageName isString
		ifFalse: [ message := aMessageName.
			message receiver: self.
			^ message ].
	message := RAMessageSend new.
	message receiver: self.
	message keywords add: (RAKeyword new name: aMessageName).
	^ message
]

{ #category : #'*ReflexiveAST-API' }
RAExpression >> send: aMessageName to: anExpression [
	| message keyword expression |
	expression := anExpression asAST.
	message := (aMessageName endsWith: '!')
		ifTrue: [ RABinaryMessageSend new ]
		ifFalse: [ RAMessageSend new ].
	message receiver: self.
	keyword := RAKeyword new
		name: aMessageName;
		expression: expression.
	message keywords add: keyword.
	^ message
]

{ #category : #'*ReflexiveAST-API' }
RAExpression >> sendMessage [
	^ RAMessageSend new receiver: self
]
