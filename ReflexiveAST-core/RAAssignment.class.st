Class {
	#name : #RAAssignment,
	#superclass : #RAExpression,
	#instVars : [
		'#variable => ToOneSlot inClass: #RAVarUsage containment: true',
		'#expression => ToOneSlot inClass: #RAExpression containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAAssignment >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitAssignment: self
]

{ #category : #accessing }
RAAssignment >> expression [
	^ expression
]

{ #category : #accessing }
RAAssignment >> expression: anExpression [
	expression := anExpression
]

{ #category : #accessing }
RAAssignment >> variable [
	^ variable
]

{ #category : #accessing }
RAAssignment >> variable: aVar [
	variable := aVar
]
