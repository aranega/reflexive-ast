Class {
	#name : #RAReturn,
	#superclass : #RAStatment,
	#instVars : [
		'#expression => ToOneSlot inClass: #RAExpression containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAReturn >> expression [
	^ expression
]

{ #category : #accessing }
RAReturn >> expression: anObject [
	expression := anObject
]
