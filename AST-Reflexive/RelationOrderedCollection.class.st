Class {
	#name : #RelationOrderedCollection,
	#superclass : #Collection,
	#instVars : [
		'owner',
		'slot',
		'set'
	],
	#category : #'AST-Reflexive-slots'
}

{ #category : #'instance creation' }
RelationOrderedCollection class >> owner: anObject slot: aToManyAssociation [

	^self new initializeOwner: anObject slot: aToManyAssociation 
]

{ #category : #adding }
RelationOrderedCollection >> add: anObject [

	(self includes: anObject)
		ifTrue: [ ^anObject ].
		
	slot add: anObject to: owner.
	^set add: anObject
]

{ #category : #copying }
RelationOrderedCollection >> copy [

	^ OrderedCollection new 
		addAll: self;
		yourself
]

{ #category : #enumerating }
RelationOrderedCollection >> do: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument."

	set do: aBlock
]

{ #category : #'initailize-release' }
RelationOrderedCollection >> initializeOwner: anObject slot: aToManyAssociation [

	owner := anObject.
	slot := aToManyAssociation.
	set := OrderedCollection new
]

{ #category : #internal }
RelationOrderedCollection >> inverseAdd: anObject [

	^set add: anObject
]

{ #category : #internal }
RelationOrderedCollection >> inverseRemove: anObject [

	^set remove: anObject
]

{ #category : #removing }
RelationOrderedCollection >> remove: oldObject ifAbsent: aBlock [

	(set includes: oldObject)
		ifFalse: [ ^aBlock value ].
		
	slot remove: oldObject from: owner.
	^set remove: oldObject ifAbsent: aBlock
]

{ #category : #accessing }
RelationOrderedCollection >> size [
	^set ifNil: [0] ifNotNil: [ set size ]
]

{ #category : #private }
RelationOrderedCollection >> species [

	^ OrderedCollection
]
