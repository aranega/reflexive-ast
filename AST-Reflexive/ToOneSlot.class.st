Class {
	#name : #ToOneSlot,
	#superclass : #RefSlot,
	#category : #'AST-Reflexive-slots'
}

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
			(oldValue class slotNamed: #parent) write: nil on: oldValue.
			(newValue class slotNamed: #parent) write: anObject on: newValue.
			 ].
	super write: newValue to: anObject
]

{ #category : #internal }
ToOneSlot >> writeInverse: newValue to: anObject [
	^anObject instVarAt: index put: newValue
]
