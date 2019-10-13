Class {
	#name : #ReferenceRelationSlot,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'#targetClass',
		'#inverseName',
		'#inverseSlot',
		'#containment',
		'#parentSlot => ParentSlot'
	],
	#category : #'ReflexiveAST-slots'
}

{ #category : #'instance creation' }
ReferenceRelationSlot class >> named: aSymbol inverse: anInverseSymbol inClass: aTargetClassOrSymbol [ 

	^(super named: aSymbol) inverse: anInverseSymbol inClass: aTargetClassOrSymbol 
]

{ #category : #comparing }
ReferenceRelationSlot >> = anObject [ 

	^super = anObject and: [ 
		self targetClassName = anObject targetClassName and: [ 
			inverseName = anObject inverseName ] ]

	
]

{ #category : #internal }
ReferenceRelationSlot >> addAssociationFrom: ownerObject to: otherObject [
	"A new reference from <ownerObject> to <otherObject> is created. Here we update the other 
	side of the association. If the other side is a ToOne association this means that an other
	association may have to be removed first."

	self inverseSlot isToOneSlot
		ifTrue: [ 
			| oldObject |
			oldObject := inverseSlot read: otherObject.
			oldObject notNil
				ifTrue: [ inverseSlot removeAssociationFrom: otherObject to: oldObject ].
			inverseSlot writeInverse: ownerObject to: otherObject ]
		ifFalse: [ 
			(inverseSlot read: otherObject) inverseAdd: ownerObject ]
]

{ #category : #internal }
ReferenceRelationSlot >> checkValue: aValue [

	(aValue isKindOf: self targetClass)
		ifFalse: [ self error: 'Invalid value' ]
]

{ #category : #accessing }
ReferenceRelationSlot >> containment: aBoolean [
	containment := aBoolean
]

{ #category : #'code generation' }
ReferenceRelationSlot >> emitStore: aMethodBuilder [
	"copy of #emitStore from Slot as my superclass has overriden it"
	| tempName |
	tempName := '0slotTempForStackManipulation'.
	aMethodBuilder
		addTemp: tempName;
		storeTemp: tempName;
		popTop;
		pushReceiver;
		pushLiteralVariable: (AdditionalBinding key: #slot value: self);
		pushTemp: tempName;
		send: #writeSlot:value:
]

{ #category : #testing }
ReferenceRelationSlot >> hasInverse [

	^inverseName notNil
]

{ #category : #comparing }
ReferenceRelationSlot >> hasSameDefinitionAs: otherSlot [
	"need to implement as superclass implements it"
	^ (super hasSameDefinitionAs: otherSlot) 
		and: [ self targetClassName = otherSlot targetClassName 
		and: [ inverseName = otherSlot inverseName ] ]
]

{ #category : #comparing }
ReferenceRelationSlot >> hash [
	^ ((self species hash bitXor: self name hash) 
			bitXor: (self index ifNil: [ 0 ])) 
				bitXor: self targetClassName hash
]

{ #category : #initialization }
ReferenceRelationSlot >> inClass: aTargetClassOrSymbol [

	targetClass := aTargetClassOrSymbol
]

{ #category : #initialization }
ReferenceRelationSlot >> inClass: aTargetClassOrSymbol containment: isContainment [

	targetClass := aTargetClassOrSymbol.
	containment := isContainment
]

{ #category : #initialization }
ReferenceRelationSlot >> initialize [
	super initialize.
	containment := false
]

{ #category : #initialization }
ReferenceRelationSlot >> inverse: anInverseSymbol inClass: aTargetClassOrSymbol [
	self inClass: aTargetClassOrSymbol.
	inverseName := anInverseSymbol
]

{ #category : #accessing }
ReferenceRelationSlot >> inverseName [

	^inverseName
]

{ #category : #accessing }
ReferenceRelationSlot >> inverseSlot [

	^inverseSlot ifNil: [ self linkUp. inverseSlot ]
]

{ #category : #accessing }
ReferenceRelationSlot >> isContainment [
	^ containment
]

{ #category : #testing }
ReferenceRelationSlot >> isToOneSlot [

	^false
]

{ #category : #initialization }
ReferenceRelationSlot >> linkUp [

	inverseSlot := self targetClass slotNamed: inverseName.
	(inverseSlot isKindOf: RelationSlot)
		ifFalse: [ self error: 'Invalid association: ... ' ].
		
	inverseSlot inverseName = self name
		ifFalse: [ self error: 'Invalid association: inverse names do not match' ].
]

{ #category : #printing }
ReferenceRelationSlot >> printOn: aStream [
	aStream 
		store: self name;
		nextPutAll: ' => ';
		nextPutAll: self class name.
	self hasInverse 
		ifTrue: [ 
			aStream
				nextPutAll: ' inverse: ';
				store: inverseName ].
	aStream
		nextPutAll: ' inClass: ';
		store: self targetClassName.
		
	self isContainment 
		ifTrue: [  
			aStream
				nextPutAll: ' containment: ';
				store: containment
		].
]

{ #category : #internal }
ReferenceRelationSlot >> removeAssociationFrom: ownerObject to: otherObject [
	"A reference from <ownerObject> to <otherObject> is removed. Here we update the other 
	side of the association. If the other side is a ToOne association set the value to nil,
	for ToMany associations remove <ownerObject> from the collection." 

	self inverseSlot isToOneSlot
		ifTrue: [ inverseSlot writeInverse: nil to: otherObject ]
		ifFalse: [ (inverseSlot read: otherObject) inverseRemove: ownerObject ]
]

{ #category : #accessing }
ReferenceRelationSlot >> targetClass [

	targetClass isSymbol
		ifTrue: [ 
			targetClass := Smalltalk globals at: targetClass 
				ifAbsent: [ self error: 'Cannot find class ', targetClass printString ] ].
	
	^targetClass
]

{ #category : #accessing }
ReferenceRelationSlot >> targetClassName [

	^targetClass isSymbol
		ifTrue: [ targetClass ]
		ifFalse: [ targetClass name ]
]
