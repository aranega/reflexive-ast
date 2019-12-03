Class {
	#name : #RAArgumentDefinition,
	#superclass : #RAVariableDefinition,
	#instVars : [
		'#keyword => ToOneSlot inverse: #argument inClass: #RAKeywordDefinition',
		'#usage => ToManySlot inverse: #reference inClass: #RAArgumentUse'
	],
	#category : #'ReflexiveAST-core-core'
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
RAArgumentDefinition >> usage [
	^ usage
]
