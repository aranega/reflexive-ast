Class {
	#name : #RAInstVar,
	#superclass : #ReflectiveAstNode,
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAInstVar >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitInstVar: self
]
