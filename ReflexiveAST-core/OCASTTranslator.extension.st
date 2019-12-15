Extension { #name : #OCASTTranslator }

{ #category : #'*ReflexiveAST-core' }
OCASTTranslator >> visitMessageSend: aNode [
	^ self visitMessageNode: aNode
]

{ #category : #'*ReflexiveAST-core' }
OCASTTranslator >> visitMethod: node [
	^ self visitMethodNode: node
]

{ #category : #'*ReflexiveAST-core' }
OCASTTranslator >> visitPseudoVariable: aVariableNode [
	^ self visitVariableNode: aVariableNode 
]

{ #category : #'*ReflexiveAST-core' }
OCASTTranslator >> visitReturn: aNode [
	^ self visitReturnNode: aNode
]

{ #category : #'*ReflexiveAST-core' }
OCASTTranslator >> visitSelf: selfNode [
	^ self visitVariableNode: selfNode
]
