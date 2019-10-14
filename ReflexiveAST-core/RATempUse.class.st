Class {
	#name : #RATempUse,
	#superclass : #RAVarUsage,
	#instVars : [
		'#reference => ToOneSlot inverse: #usage inClass: #RATempDefinition'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RATempUse >> reference [
	^ reference
]

{ #category : #accessing }
RATempUse >> reference: anObject [
	reference := anObject
]
