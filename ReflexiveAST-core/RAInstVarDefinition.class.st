Class {
	#name : #RAInstVarDefinition,
	#superclass : #RAVariableDefinition,
	#instVars : [
		'#originSlot => ToOneSlot inClass: #Slot',
		'#owningClass => ToOneSlot inverse: #instVars inClass: #RAClass',
		'#usage => ToManySlot inverse: #reference inClass: #RAInstVarUse'
	],
	#category : #'ReflexiveAST-core-core'
}

{ #category : #initialization }
RAInstVarDefinition >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitInstVar: self
]

{ #category : #initialization }
RAInstVarDefinition >> createUse [
	^ RAInstVarUse new reference: self
]

{ #category : #initialization }
RAInstVarDefinition >> initialize [
	super initialize.
]

{ #category : #initialization }
RAInstVarDefinition >> originSlot [
	^ originSlot 
]

{ #category : #initialization }
RAInstVarDefinition >> originSlot: aSlot [
	originSlot := aSlot 
]

{ #category : #initialization }
RAInstVarDefinition >> owningClass [
	^ owningClass 
]

{ #category : #initialization }
RAInstVarDefinition >> owningClass: aRAClass [
	owningClass := aRAClass 
]

{ #category : #initialization }
RAInstVarDefinition >> usage [
	^ usage
]

{ #category : #initialization }
RAInstVarDefinition >> usage: aVarInstUse [
	usage := aVarInstUse
]
