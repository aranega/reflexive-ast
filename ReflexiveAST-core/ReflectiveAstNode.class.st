Class {
	#name : #ReflectiveAstNode,
	#superclass : #Object,
	#instVars : [
		'#parent => ParentSlot'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
ReflectiveAstNode >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #accessing }
ReflectiveAstNode >> parent [
	^ parent
]
