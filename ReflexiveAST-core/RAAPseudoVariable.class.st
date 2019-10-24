Class {
	#name : #RAAPseudoVariable,
	#superclass : #RAVarUsage,
	#instVars : [
		'name'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAAPseudoVariable >> acceptVisitor: aVisitor [
	^ aVisitor visitPseudoVariable: self
]

{ #category : #accessing }
RAAPseudoVariable >> name [
	^ name
]

{ #category : #accessing }
RAAPseudoVariable >> name: aName [
	name := aName
]
