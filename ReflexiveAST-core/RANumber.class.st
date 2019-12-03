Class {
	#name : #RANumber,
	#superclass : #RALiteral,
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RANumber >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitNumber: self
]
