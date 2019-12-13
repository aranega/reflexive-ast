Class {
	#name : #RAReturn,
	#superclass : #RAStatement,
	#instVars : [
		'#expression => ToOneSlot inClass: #RAExpression containment: true'
	],
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RAReturn >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitReturn: self
]

{ #category : #accessing }
RAReturn >> expression [
	^ expression
]

{ #category : #accessing }
RAReturn >> expression: anObject [
	expression := anObject
]

{ #category : #accessing }
RAReturn >> isReturn [
	^ true
]
