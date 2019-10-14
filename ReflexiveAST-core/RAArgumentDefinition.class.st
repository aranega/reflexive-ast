Class {
	#name : #RAArgumentDefinition,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#keyword => ToOneSlot inverse: #argument inClass: #RAKeywordDefinition',
		'#usage => ToManySlot inverse: #reference inClass: #RAArgumentUse',
		'#name'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAArgumentDefinition >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitArgumentDefinition: self
]

{ #category : #initialization }
RAArgumentDefinition >> initialize [
	super initialize.
]

{ #category : #accessing }
RAArgumentDefinition >> keyword [
	^ keyword
]

{ #category : #accessing }
RAArgumentDefinition >> keyword: anObject [
	keyword := anObject
]

{ #category : #accessing }
RAArgumentDefinition >> name [
	^ name
]

{ #category : #accessing }
RAArgumentDefinition >> name: aName [
	name := aName
]

{ #category : #accessing }
RAArgumentDefinition >> usage [
	^ usage
]
