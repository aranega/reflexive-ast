Class {
	#name : #RAMessageSend,
	#superclass : #RAExpression,
	#instVars : [
		'#receiver => ToOneSlot inClass: #RAExpression containment: true',
		'#keywords => ToManySlot inClass: #RAKeyword containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RAMessageSend >> initialize [
	super initialize.
]

{ #category : #accessing }
RAMessageSend >> keywords [
	^ keywords
]

{ #category : #accessing }
RAMessageSend >> receiver [
	^ receiver
]

{ #category : #accessing }
RAMessageSend >> receiver: anObject [
	receiver := anObject
]
