Class {
	#name : #RADynamicArray,
	#superclass : #RAExpression,
	#instVars : [
		'#expressions => ToManySlot inClass: #RAExpression containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RADynamicArray >> expressions [
	^ expressions
]

{ #category : #initialization }
RADynamicArray >> initialize [
	super initialize.
]
