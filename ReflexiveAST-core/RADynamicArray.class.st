Class {
	#name : #RADynamicArray,
	#superclass : #RAExpression,
	#instVars : [
		'#expressions => ToManySlot inClass: #RAExpression containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RADynamicArray >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitDynamicArray: self
]

{ #category : #accessing }
RADynamicArray >> expressions [
	^ expressions
]

{ #category : #initialization }
RADynamicArray >> initialize [
	super initialize.
]
