Class {
	#name : #RAArgumentDefinition,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#keyword => ToOneSlot inverse: #argument inClass: #RAKeywordDefinition',
		'#usage => ToManySlot inverse: #reference inClass: #RAArgumentUse'
	],
	#category : #'ReflexiveAST-core'
}

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
