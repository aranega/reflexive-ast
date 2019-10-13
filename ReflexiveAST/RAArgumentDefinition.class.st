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
