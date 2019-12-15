Class {
	#name : #RAPseudoVariable,
	#superclass : #RAVarUsage,
	#instVars : [
		'name'
	],
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RAPseudoVariable >> acceptVisitor: aVisitor [
	^ aVisitor visitPseudoVariable:  self
]

{ #category : #accessing }
RAPseudoVariable >> name [
	^ name
]

{ #category : #accessing }
RAPseudoVariable >> name: aName [
	name := aName
]
