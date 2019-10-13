Class {
	#name : #RAMethod,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true',
		'#statements => ToManySlot inClass: #RATempDefinition containment: true'
	],
	#category : #'AST-Reflexive-core'
}

{ #category : #initialization }
RAMethod >> initialize [
	super initialize.
]

{ #category : #accessing }
RAMethod >> temporaries [
	^ temporaries
]
