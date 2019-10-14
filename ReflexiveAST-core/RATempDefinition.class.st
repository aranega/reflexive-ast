Class {
	#name : #RATempDefinition,
	#superclass : #RAVariableDefinition,
	#instVars : [
		'#usage => ToManySlot inverse: #reference inClass: #RATempUse'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RATempDefinition >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitTempDefinition: self
]

{ #category : #initialization }
RATempDefinition >> initialize [
	super initialize.
]

{ #category : #accessing }
RATempDefinition >> usage [
	^ usage
]
