Class {
	#name : #RACreator,
	#superclass : #Object,
	#category : #'ReflexiveAST-API'
}

{ #category : #'as yet unclassified' }
RACreator class >> createLiteral: aLiteral [
	aLiteral isNumber ifTrue: [ ^ RANumber new literalValue: aLiteral ].
	aLiteral isArray ifTrue: [ ^ RAArray new literalValue: aLiteral ].
	aLiteral isString ifTrue: [ ^ RAString new literalValue: aLiteral ].
]

{ #category : #'as yet unclassified' }
RACreator class >> createMethod: aName [
	^ RAMethod new name: aName
]
