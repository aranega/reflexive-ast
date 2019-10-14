Class {
	#name : #RAInstVarUse,
	#superclass : #RAVarUsage,
	#instVars : [
		'#reference => ToOneSlot inverse: #usage inClass: #RAInstVar'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAInstVarUse >> reference [
	^ reference
]

{ #category : #accessing }
RAInstVarUse >> reference: anObject [
	reference := anObject
]
