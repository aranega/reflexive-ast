Class {
	#name : #RAMessageSend,
	#superclass : #RAExpression,
	#instVars : [
		'#receiver => ToOneSlot inClass: #RAExpression containment: true',
		'#keywords => ToManySlot inClass: #RAKeyword containment: true'
	],
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RAMessageSend >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitMessageSend: self
]

{ #category : #accessing }
RAMessageSend >> arguments [
	^ (keywords collect: [ :k | k expression ]) reject: [ :e | e isNil ]
]

{ #category : #accessing }
RAMessageSend >> hasArguments [
	^ self arguments isNotEmpty 
]

{ #category : #initialization }
RAMessageSend >> initialize [
	super initialize.
]

{ #category : #accessing }
RAMessageSend >> isBinary [
	^ false
]

{ #category : #'rbast-polymorphic' }
RAMessageSend >> isCascaded [
	^ false
]

{ #category : #'rbast-polymorphic' }
RAMessageSend >> isInlined [
	^ false
]

{ #category : #'rbast-polymorphic' }
RAMessageSend >> isSuperSend [
	^ self receiver isVariable and: [ self receiver name = 'super' ]
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

{ #category : #'rbast-polymorphic' }
RAMessageSend >> selector [
	^ keywords inject: '' into: [ :res :each | res, each name ]
]
