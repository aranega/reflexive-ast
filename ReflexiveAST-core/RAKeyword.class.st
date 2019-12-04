Class {
	#name : #RAKeyword,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#expression => ToOneSlot inClass: #RAExpression containment: true',
		'#name'
	],
	#category : #'ReflexiveAST-core-core'
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

{ #category : #accessing }
RAKeyword >> hasExpression [
	^ expression isNotNil 
]

{ #category : #accessing }
RAKeyword >> name [
	^ name
]

{ #category : #accessing }
RAKeyword >> name: aName [
	name := aName
]
