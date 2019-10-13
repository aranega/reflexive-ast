Class {
	#name : #RAMessageSend,
	#superclass : #RAExpression,
	#instVars : [
		'#receiver => ToOneSlot inClass: #RAExpression containment: true',
		'#keywords => ToManySlot inClass: #RAKeyword containment: true'
	],
	#category : #'AST-Reflexive-core'
}

{ #category : #initialization }
RAMessageSend >> initialize [
	super initialize.
]
