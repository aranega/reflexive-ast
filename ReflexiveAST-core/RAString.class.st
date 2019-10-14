Class {
	#name : #RAString,
	#superclass : #RALiteral,
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAString >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitString: self
]
