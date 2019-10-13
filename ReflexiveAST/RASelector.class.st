Class {
	#name : #RASelector,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#keywords => ToManySlot inClass: #RAKeywordDefinition containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RASelector >> initialize [
	super initialize.
]

{ #category : #accessing }
RASelector >> keywords [
	^ keywords
]
