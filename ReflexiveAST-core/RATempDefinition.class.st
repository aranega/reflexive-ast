Class {
	#name : #RATempDefinition,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#name',
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
RATempDefinition >> name [
	^ name
]

{ #category : #accessing }
RATempDefinition >> name: anObject [
	name := anObject
]

{ #category : #accessing }
RATempDefinition >> usage [
	^ usage
]
