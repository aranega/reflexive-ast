Extension { #name : #RAMessageSend }

{ #category : #'*ReflexiveAST-UI' }
RAMessageSend >> display [
	^ '{1} {2} {3}'
		format:
			{receiver display.
			self selector.
			(self hasArguments
				ifTrue: [ '(...)' ]
				ifFalse: [ '' ])}
]
