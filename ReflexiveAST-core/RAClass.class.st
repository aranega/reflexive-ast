Class {
	#name : #RAClass,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#originClass => ToOneSlot inClass: #Class',
		'#methods => ToManySlot inverse: #owningClass inClass: #RAMethod containment: true',
		'#instVars => ToManySlot inverse: #owningClass inClass: #RAInstVarDefinition containment: true',
		'#name'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RAClass >> = anotherRAClass [
	^ originClass = anotherRAClass originClass
]

{ #category : #accessing }
RAClass >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitClass: self
]

{ #category : #accessing }
RAClass >> createOrGetInstVarNamed: aName [
	| subresult |
	subresult := instVars select: [ :c | c originSlot name = aName ].
	subresult
		ifEmpty: [ | instvdef slot |
			slot := self originClass slotNamed: aName.
			instvdef := RAInstVarDefinition new.
			instvdef name: aName.
			instvdef originSlot: slot.
			instvdef owningClass: self.
			instVars add: instvdef.
			^ instvdef ].
	^ subresult at: 1
]

{ #category : #initialization }
RAClass >> initialize [
	super initialize.
]

{ #category : #accessing }
RAClass >> instVars [
	^ instVars 
]

{ #category : #accessing }
RAClass >> methods [
	^ methods
]

{ #category : #accessing }
RAClass >> name [
	^ name
]

{ #category : #accessing }
RAClass >> name: aName [
	name := aName
]

{ #category : #initialization }
RAClass >> originClass [
	^ originClass 
]

{ #category : #initialization }
RAClass >> originClass: aClass [
	originClass := aClass 
]
