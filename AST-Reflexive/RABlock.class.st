Class {
	#name : #RABlock,
	#superclass : #RAExpression,
	#instVars : [
		'#statements => ToManySlot inClass: #RAStatment containment: true',
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true'
	],
	#category : #'AST-Reflexive-core'
}

{ #category : #initialization }
RABlock >> initialize [
	super initialize.
]
