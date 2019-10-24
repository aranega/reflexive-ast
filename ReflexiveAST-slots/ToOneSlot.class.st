Class {
	#name : #ToOneSlot,
	#superclass : #ReferenceRelationSlot,
	#category : #'ReflexiveAST-slots'
}

{ #category : #internal }
ToOneSlot >> isMany [
	^ false
]

{ #category : #internal }
ToOneSlot >> isSingle [
	^ true
]

{ #category : #testing }
ToOneSlot >> isToOneSlot [

	^true
]

{ #category : #'meta-object-protocol' }
ToOneSlot >> write: newValue to: anObject [

	| oldValue |

	oldValue := self read: anObject.
	newValue notNil
		ifTrue: [ self checkValue: newValue ].
	self hasInverse 
		ifTrue: [ 
			oldValue notNil
				ifTrue: [ self removeAssociationFrom: anObject to: oldValue ].
			newValue notNil
				ifTrue: [ self addAssociationFrom: anObject to: newValue ] ].	
				
	self isContainment
		ifTrue: [ 
			oldValue ifNotNil: [(oldValue class slotNamed: #parent) write: nil to: oldValue].
			newValue ifNotNil: [(newValue class slotNamed: #parent) write: anObject to: newValue].
			 ].
	super write: newValue to: anObject
]

{ #category : #internal }
ToOneSlot >> writeInverse: newValue to: anObject [
	^anObject instVarAt: index put: newValue
]
