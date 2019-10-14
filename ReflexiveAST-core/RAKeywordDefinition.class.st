Class {
	#name : #RAKeywordDefinition,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#argument => ToOneSlot inClass: #RAArgumentDefinition containment: true',
		'#name'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAKeywordDefinition >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitKeywordDefinition: self
]

{ #category : #accessing }
RAKeywordDefinition >> argument [
	^ argument
]

{ #category : #accessing }
RAKeywordDefinition >> argument: anObject [
	argument := anObject
]

{ #category : #accessing }
RAKeywordDefinition >> name [ 	
	^ name
]

{ #category : #accessing }
RAKeywordDefinition >> name: aName [
	name := aName
]
