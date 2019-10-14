Class {
	#name : #RABinaryMessageSend,
	#superclass : #RAMessageSend,
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RABinaryMessageSend >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitBinaryMessageSend: self
]

{ #category : #accessing }
RABinaryMessageSend >> isBinary [
	^ true
]
