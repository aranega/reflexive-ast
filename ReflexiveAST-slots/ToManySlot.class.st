Class {
	#name : #ToManySlot,
	#superclass : #ReferenceRelationSlot,
	#instVars : [
		'ordered'
	],
	#category : #'ReflexiveAST-slots'
}

{ #category : #internal }
ToManySlot class >> inClass: aClass containment: isContainment ordered: isOrdered [ 
	| inst |
	inst := self new inClass: aClass containment: isContainment.
	inst ordered: isOrdered.
	^ inst
]

{ #category : #internal }
ToManySlot class >> inClass: aClass ordered: isOrdered [ 
	^ self inClass: aClass containment: false ordered: isOrdered
]

{ #category : #internal }
ToManySlot class >> inverse: anInverseSymbol inClass: aTargetClassOrSymbol containment: isContainment ordered: isOrdered [
	| inst |
	inst := self new inverse: anInverseSymbol inClass: aTargetClassOrSymbol.
	inst containment: isContainment; ordered: isOrdered.
	^ inst
]

{ #category : #internal }
ToManySlot >> add: newObject to: collectionOwner [
	| oldValue |
	self checkValue: newObject.
	self hasInverse
		ifTrue: [ self addAssociationFrom: collectionOwner to: newObject ].
	self isContainment
		ifFalse: [ ^ self ].
	(newObject class slotNamed: #parent)
		write: collectionOwner
		to: newObject
]

{ #category : #internal }
ToManySlot >> inClass: aClass containment: isContainment ordered: isOrdered [ 
	self inClass: aClass containment: isContainment.
	ordered := isOrdered
]

{ #category : #internal }
ToManySlot >> inClass: aClass ordered: isOrdered [ 
	self inClass: aClass containment: false.
	ordered := isOrdered
]

{ #category : #initialization }
ToManySlot >> initialize [
	super initialize.
	ordered := true
]

{ #category : #initialization }
ToManySlot >> initialize: anObject [
	| collectionType |
	collectionType := ordered ifTrue: [ RelationOrderedCollection ] ifFalse: [ RelationUSet ].
	self write: (collectionType owner: anObject slot: self) to: anObject. 
	
]

{ #category : #internal }
ToManySlot >> inverse: anInverseSymbol inClass: aTargetClassOrSymbol containment: isContainment ordered: isOrdered [
	self inverse: anInverseSymbol inClass: aTargetClassOrSymbol.
	self containment: isContainment; ordered: isOrdered.
]

{ #category : #internal }
ToManySlot >> isOrdered [
	^ ordered
]

{ #category : #internal }
ToManySlot >> ordered: isOrdered [
	ordered := isOrdered
]

{ #category : #'meta-object-protocol' }
ToManySlot >> printOn: aStream [
	super printOn: aStream.
		
	self isOrdered
		ifFalse: [  
			aStream
				nextPutAll: ' ordered: ';
				store: ordered
		].
]

{ #category : #internal }
ToManySlot >> remove: oldObject from: collectionOwner [
	(oldObject class slotNamed: #parent) write: nil to: oldObject.
	self hasInverse
		ifTrue: [ self removeAssociationFrom: collectionOwner to: oldObject ]
]

{ #category : #'meta-object-protocol' }
ToManySlot >> wantsInitialization [
	^ true
]
