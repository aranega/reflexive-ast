Class {
	#name : #ReflectiveAstNode,
	#superclass : #Object,
	#instVars : [
		'#parent => ParentSlot'
	],
	#category : #'AST-Reflexive-core'
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
