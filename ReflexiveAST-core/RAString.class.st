Class {
	#name : #RAString,
	#superclass : #RALiteral,
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RAString >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitString: self
]
