Class {
	#name : #RATempDefinition,
	#superclass : #RAVariableDefinition,
	#instVars : [
		'#usage => ToManySlot inverse: #reference inClass: #RATempUse'
	],
	#category : #'ReflexiveAST-core-core'
}

{ #category : #initialization }
RATempDefinition >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitTempDefinition: self
]

{ #category : #accessing }
RATempDefinition >> createUse [
	^ RATempUse new reference: self
]

{ #category : #initialization }
RATempDefinition >> initialize [
	super initialize.
]

{ #category : #accessing }
RATempDefinition >> usage [
	^ usage
]
