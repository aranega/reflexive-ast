Class {
	#name : #RASelector,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#keywords => ToManySlot inClass: #RAKeywordDefinition containment: true'
	],
	#category : #'AST-Reflexive-core'
}

{ #category : #initialization }
RASelector >> initialize [
	super initialize.
]
