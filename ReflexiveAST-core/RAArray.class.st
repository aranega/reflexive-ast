Class {
	#name : #RAArray,
	#superclass : #RALiteral,
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAArray >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitArray: self
]
