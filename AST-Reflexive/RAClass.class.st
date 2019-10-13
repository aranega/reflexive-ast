Class {
	#name : #RAClass,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#instVars => ToManySlot inClass: #RAInstVar containment: true'
	],
	#category : #'AST-Reflexive-core'
}

{ #category : #initialization }
RAClass >> initialize [
	super initialize.
]
