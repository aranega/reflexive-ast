Class {
	#name : #RACreateSubNode,
	#superclass : #CmCommand,
	#instVars : [
		'owner',
		'type'
	],
	#category : #'ReflexiveAST-UI'
}

{ #category : #initialization }
RACreateSubNode >> initialize [
	super initialize.
	self description: 'Creates a new ast node'
]

{ #category : #initialization }
RACreateSubNode >> owner: aNode [
	owner := aNode
]

{ #category : #initialization }
RACreateSubNode >> type: aType [
	type := aType.
	self name: ('Create {1} instance' format: {aType name})
]
