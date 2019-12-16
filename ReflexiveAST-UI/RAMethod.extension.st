Extension { #name : #RAMethod }

{ #category : #'*ReflexiveAST-UI' }
RAMethod >> display [
	^ '{1}>>#{2}'
		format:
			{owningClass name.
			self selector}
]
