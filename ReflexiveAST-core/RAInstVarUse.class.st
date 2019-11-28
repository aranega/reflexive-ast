Class {
	#name : #RAInstVarUse,
	#superclass : #RAVarUsage,
	#instVars : [
		'#reference => ToOneSlot inClass: #Slot'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAInstVarUse >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitInstVarUse: self
]

{ #category : #accessing }
RAInstVarUse >> reference [
	^ reference
]

{ #category : #accessing }
RAInstVarUse >> reference: anObject [
	reference := anObject
]
