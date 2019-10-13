Class {
	#name : #RADynamicArray,
	#superclass : #RAExpression,
	#instVars : [
		'#expressions => ToManySlot inClass: #RAExpression containment: true'
	],
	#category : #'AST-Reflexive-core'
}

{ #category : #initialization }
RADynamicArray >> initialize [
	super initialize.
]
