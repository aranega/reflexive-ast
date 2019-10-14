Class {
	#name : #RAInstVarDefinition,
	#superclass : #RAVariableDefinition,
	#instVars : [
		'#usage => ToManySlot inverse: #reference inClass: #RAInstVarUse'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAInstVarDefinition >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitInstVar: self
]

{ #category : #initialization }
RAInstVarDefinition >> definingClass [
	^ self parent
]

{ #category : #initialization }
RAInstVarDefinition >> initialize [
	super initialize.
]

{ #category : #initialization }
RAInstVarDefinition >> usage [
	^ usage
]
