Class {
	#name : #RAMessageSend,
	#superclass : #RAExpression,
	#instVars : [
		'#receiver => ToOneSlot inClass: #RAExpression containment: true',
		'#keywords => ToManySlot inClass: #RAKeyword containment: true',
		'#isBinary'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAMessageSend >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitMessageSend: self
]

{ #category : #initialization }
RAMessageSend >> initialize [
	super initialize.
]

{ #category : #accessing }
RAMessageSend >> isBinary [
	^ false
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
