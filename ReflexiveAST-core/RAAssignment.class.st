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
