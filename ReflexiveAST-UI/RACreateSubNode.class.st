Class {
	#name : #RACreateSubNode,
	#superclass : #CmCommand,
	#instVars : [
		'owner',
		'type',
		'slot',
		'presenter'
	],
	#category : #'ReflexiveAST-UI'
}

{ #category : #executing }
RACreateSubNode >> execute [
	| instance |
	instance := type new.
	slot isMany
		ifTrue: [ (slot read: owner) add: instance ]
		ifFalse: [ slot write: owner to: instance ].
	presenter updateView
]

{ #category : #executing }
RACreateSubNode >> forSlot: aSlot [
	slot := aSlot
]

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
RACreateSubNode >> presenter: aPresenter [
	presenter := aPresenter
]

{ #category : #initialization }
RACreateSubNode >> type: aType [
	type := aType.
	self name: ('Create {1} instance' format: {aType name})
]
