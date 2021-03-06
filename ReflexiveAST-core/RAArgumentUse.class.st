Class {
	#name : #RAArgumentUse,
	#superclass : #RAVarUsage,
	#instVars : [
		'#reference => ToOneSlot inverse: #usage inClass: #RAArgumentDefinition'
	],
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RAArgumentUse >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitArgumentUse: self
]

{ #category : #accessing }
RAArgumentUse >> name: aString [
	reference name: aString
]

{ #category : #accessing }
RAArgumentUse >> reference [
	^ reference
]

{ #category : #accessing }
RAArgumentUse >> reference: anObject [
	reference := anObject
]
