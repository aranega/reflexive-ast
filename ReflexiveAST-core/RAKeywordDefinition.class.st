Class {
	#name : #RAKeywordDefinition,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#argument => ToOneSlot inClass: #RAArgumentDefinition containment: true'
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
