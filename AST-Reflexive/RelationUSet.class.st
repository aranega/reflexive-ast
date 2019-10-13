Class {
	#name : #RelationUSet,
	#superclass : #Collection,
	#instVars : [
		'owner',
		'slot',
		'set'
	],
	#category : #'AST-Reflexive-slots'
}

{ #category : #'instance creation' }
RelationUSet class >> owner: anObject slot: aToManyAssociation [

	^self new initializeOwner: anObject slot: aToManyAssociation 
]

{ #category : #adding }
RelationUSet >> add: anObject [

	(self includes: anObject)
		ifTrue: [ ^anObject ].
		
	slot add: anObject to: owner.
	^set add: anObject
]

{ #category : #copying }
RelationUSet >> copy [

	^Set new 
		addAll: self;
		yourself
]

{ #category : #enumerating }
RelationUSet >> do: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument."

	set do: aBlock
]

{ #category : #'initailize-release' }
RelationUSet >> initializeOwner: anObject slot: aToManyAssociation [

	owner := anObject.
	slot := aToManyAssociation.
	set := Set new
]

{ #category : #internal }
RelationUSet >> inverseAdd: anObject [

	^set add: anObject
]

{ #category : #internal }
RelationUSet >> inverseRemove: anObject [

	^set remove: anObject
]

{ #category : #removing }
RelationUSet >> remove: oldObject ifAbsent: aBlock [

	(set includes: oldObject)
		ifFalse: [ ^aBlock value ].
		
	slot remove: oldObject from: owner.
	^set remove: oldObject ifAbsent: aBlock
]

{ #category : #accessing }
RelationUSet >> size [
	^set ifNil: [0] ifNotNil: [ set size ]
]

{ #category : #private }
RelationUSet >> species [

	^Set
]
