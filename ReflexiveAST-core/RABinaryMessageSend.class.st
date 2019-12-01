Class {
	#name : #RABinaryMessageSend,
	#superclass : #RAMessageSend,
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RABinaryMessageSend >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitBinaryMessageSend: self
]

{ #category : #accessing }
RABinaryMessageSend >> isBinary [
	^ true
]

{ #category : #accessing }
RABinaryMessageSend >> left [
	^ self receiver
]

{ #category : #accessing }
RABinaryMessageSend >> left: anElement [
	self receiver: anElement
]

{ #category : #accessing }
RABinaryMessageSend >> operator [
	^ (self keywords at: 1) name
]

{ #category : #accessing }
RABinaryMessageSend >> operator: aStringOrSymbol [
	self keywords
		ifEmpty: [ | keyword |
			keyword := RAKeyword new.
			keyword name: aStringOrSymbol.
			self keywords add: keyword ]
		ifNotEmpty: [ (self keywords at: 1) name: aStringOrSymbol ]
]

{ #category : #accessing }
RABinaryMessageSend >> right [
	^ self arguments at: 1
]

{ #category : #accessing }
RABinaryMessageSend >> right: anExpression [
	self keywords
		ifEmpty: [ | keyword |
			keyword := RAKeyword new.
			keyword expression: anExpression.
			self keywords add: keyword ]
		ifNotEmpty: [ (self keywords at: 1) expression: anExpression ]
]
