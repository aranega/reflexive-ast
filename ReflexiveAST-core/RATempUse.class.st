Class {
	#name : #RATempUse,
	#superclass : #RAVarUsage,
	#instVars : [
		'#reference => ToOneSlot inverse: #usage inClass: #RATempDefinition'
	],
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RATempUse >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitTempUse: self
]

{ #category : #accessing }
RATempUse >> reference [
	^ reference
]

{ #category : #accessing }
RATempUse >> reference: anObject [
	reference := anObject
]
