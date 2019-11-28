Class {
	#name : #RAMethod,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#keywords => ToManySlot inClass: #RAKeywordDefinition containment: true',
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true',
		'#statements => ToManySlot inClass: #RAStatement containment: true',
		'#owningClass => ToOneSlot inClass: #Class'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RAMethod >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitMethod: self
]

{ #category : #accessing }
RAMethod >> accessibleArguments [
	^ self arguments
]

{ #category : #accessing }
RAMethod >> allOwnedBlocks [
	^ self statements
		flatCollect: [ :stmt | stmt allChildren select: [ :each | each isBlock ] ]
]

{ #category : #accessing }
RAMethod >> arguments [
	^ keywords collect: [ :each | each argument ]
]

{ #category : #initialization }
RAMethod >> initialize [
	super initialize.
]

{ #category : #accessing }
RAMethod >> keywords [
	^ keywords
]

{ #category : #accessing }
RAMethod >> ownedBlocks [
	^ self statements select: [ :each | each isBlock ]
]

{ #category : #accessing }
RAMethod >> owningClass [
	^ owningClass
]

{ #category : #accessing }
RAMethod >> owningClass: aClass [
	owningClass := aClass
]

{ #category : #accessing }
RAMethod >> statements [
	^ statements
]

{ #category : #accessing }
RAMethod >> temporaries [
	^ temporaries
]
