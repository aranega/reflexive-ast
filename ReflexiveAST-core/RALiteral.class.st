Class {
	#name : #RALiteral,
	#superclass : #RAExpression,
	#instVars : [
		'literalValue'
	],
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RALiteral >> literalValue [
	^ literalValue
]

{ #category : #accessing }
RALiteral >> literalValue: anObject [
	literalValue := anObject
]
