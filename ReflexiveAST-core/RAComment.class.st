Class {
	#name : #RAComment,
	#superclass : #RALiteral,
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAComment >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitComment: self
]
