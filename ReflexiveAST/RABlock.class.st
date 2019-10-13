Class {
	#name : #RABlock,
	#superclass : #RAExpression,
	#instVars : [
		'#statements => ToManySlot inClass: #RAStatment containment: true',
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RABlock >> initialize [
	super initialize.
]
