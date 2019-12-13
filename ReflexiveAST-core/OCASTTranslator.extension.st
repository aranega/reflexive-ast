Extension { #name : #OCASTTranslator }

{ #category : #'*ReflexiveAST-core' }
OCASTTranslator >> visitMethod: node [
	^ self visitMethodNode: node
]

{ #category : #'*ReflexiveAST-core' }
OCASTTranslator >> visitReturn: aNode [
	^ self visitReturnNode: aNode
]
