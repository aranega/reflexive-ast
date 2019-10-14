Class {
	#name : #RANumber,
	#superclass : #RALiteral,
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RANumber >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitNumber: self
]
