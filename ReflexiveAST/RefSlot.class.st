Class {
	#name : #RefSlot,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'#targetClass',
		'#inverseName',
		'#inverseSlot',
		'#containment',
		'#parentSlot => AnObsoleteHiddenParentSlot'
	],
	#category : #'ReflexiveAST-slots'
}

{ #category : #'instance creation' }
RefSlot class >> named: aSymbol inverse: anInverseSymbol inClass: aTargetClassOrSymbol [ 

	^(super named: aSymbol) inverse: anInverseSymbol inClass: aTargetClassOrSymbol 
]

{ #category : #comparing }
RefSlot >> = anObject [ 

	^super = anObject and: [ 
		self targetClassName = anObject targetClassName and: [ 
			inverseName = anObject inverseName ] ]

	
]

{ #category : #internal }
RefSlot >> addAssociationFrom: ownerObject to: otherObject [
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
RefSlot >> checkValue: aValue [

	(aValue isKindOf: self targetClass)
		ifFalse: [ self error: 'Invalid value' ]
]

{ #category : #accessing }
RefSlot >> containment: aBoolean [
	containment := aBoolean
]

{ #category : #'code generation' }
RefSlot >> emitStore: aMethodBuilder [
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
RefSlot >> hasInverse [

	^inverseName notNil
]

{ #category : #comparing }
RefSlot >> hasSameDefinitionAs: otherSlot [
	"need to implement as superclass implements it"
	^ (super hasSameDefinitionAs: otherSlot) 
		and: [ self targetClassName = otherSlot targetClassName 
		and: [ inverseName = otherSlot inverseName ] ]
]

{ #category : #comparing }
RefSlot >> hash [
	^ ((self species hash bitXor: self name hash) 
			bitXor: (self index ifNil: [ 0 ])) 
				bitXor: self targetClassName hash
]

{ #category : #initialization }
RefSlot >> inClass: aTargetClassOrSymbol [

	targetClass := aTargetClassOrSymbol
]

{ #category : #initialization }
RefSlot >> inClass: aTargetClassOrSymbol containment: isContainment [

	targetClass := aTargetClassOrSymbol.
	containment := isContainment
]

{ #category : #initialization }
RefSlot >> initialize [
	super initialize.
	containment := false
]

{ #category : #initialization }
RefSlot >> inverse: anInverseSymbol inClass: aTargetClassOrSymbol [
	self inClass: aTargetClassOrSymbol.
	inverseName := anInverseSymbol
]

{ #category : #accessing }
RefSlot >> inverseName [

	^inverseName
]

{ #category : #accessing }
RefSlot >> inverseSlot [

	^inverseSlot ifNil: [ self linkUp. inverseSlot ]
]

{ #category : #accessing }
RefSlot >> isContainment [
	^ containment
]

{ #category : #testing }
RefSlot >> isToOneSlot [

	^false
]

{ #category : #initialization }
RefSlot >> linkUp [

	inverseSlot := self targetClass slotNamed: inverseName.
	(inverseSlot isKindOf: RelationSlot)
		ifFalse: [ self error: 'Invalid association: ... ' ].
		
	inverseSlot inverseName = self name
		ifFalse: [ self error: 'Invalid association: inverse names do not match' ].
]

{ #category : #printing }
RefSlot >> printOn: aStream [
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
RefSlot >> removeAssociationFrom: ownerObject to: otherObject [
	"A reference from <ownerObject> to <otherObject> is removed. Here we update the other 
	side of the association. If the other side is a ToOne association set the value to nil,
	for ToMany associations remove <ownerObject> from the collection." 

	self inverseSlot isToOneSlot
		ifTrue: [ inverseSlot writeInverse: nil to: otherObject ]
		ifFalse: [ (inverseSlot read: otherObject) inverseRemove: ownerObject ]
]

{ #category : #accessing }
RefSlot >> targetClass [

	targetClass isSymbol
		ifTrue: [ 
			targetClass := Smalltalk globals at: targetClass 
				ifAbsent: [ self error: 'Cannot find class ', targetClass printString ] ].
	
	^targetClass
]

{ #category : #accessing }
RefSlot >> targetClassName [

	^targetClass isSymbol
		ifTrue: [ targetClass ]
		ifFalse: [ targetClass name ]
]
