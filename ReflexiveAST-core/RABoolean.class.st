Class {
	#name : #RABoolean,
	#superclass : #RALiteral,
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RABoolean >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitBoolean: self
]
