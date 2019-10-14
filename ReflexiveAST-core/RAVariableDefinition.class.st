Class {
	#name : #RAVariableDefinition,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'name'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RAVariableDefinition >> initialize [
	super initialize.
]

{ #category : #initialization }
RAVariableDefinition >> name [
	^ name
]

{ #category : #initialization }
RAVariableDefinition >> name: aName [
	name := aName
]
