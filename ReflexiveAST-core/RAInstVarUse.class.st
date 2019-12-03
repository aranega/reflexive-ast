Class {
	#name : #RAInstVarUse,
	#superclass : #RAVarUsage,
	#instVars : [
		'#reference => ToOneSlot inverse: #usage inClass: #RAInstVarDefinition'
	],
	#category : #'ReflexiveAST-core-core'
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
