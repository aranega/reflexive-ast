Class {
	#name : #ReflectiveAstNode,
	#superclass : #Object,
	#instVars : [
		'#parent => ParentSlot'
	],
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
ReflectiveAstNode >> acceptVisitor: aVisitor [
	self subclassResponsibility 
]

{ #category : #accessing }
ReflectiveAstNode >> allChildren [
	^ self children, (self children flatCollect: [ :each | each allChildren ]). 
]

{ #category : #accessing }
ReflectiveAstNode >> asAST [
	^ self
]

{ #category : #accessing }
ReflectiveAstNode >> children [
	| children |
	children := OrderedCollection new.
	self class slots
		do: [ :slot | 
			((slot isKindOf: ReferenceRelationSlot) and: [ slot isContainment ])
				ifTrue: [ slot isMany
						ifTrue: [ children addAll: (slot read: self) ]
						ifFalse: [ | elem |
							elem := slot read: self.
							elem ifNotNil: [ children add: elem ] ] ] ].
	^ children
]

{ #category : #accessing }
ReflectiveAstNode >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #accessing }
ReflectiveAstNode >> parent [
	^ parent
]
