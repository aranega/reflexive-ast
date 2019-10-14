Class {
	#name : #RAKeyword,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#expression => ToOneSlot inClass: #RAExpression containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAKeyword >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitKeyword: self
]

{ #category : #accessing }
RAKeyword >> expression [
	^ expression
]

{ #category : #accessing }
RAKeyword >> expression: anObject [
	expression := anObject
]
