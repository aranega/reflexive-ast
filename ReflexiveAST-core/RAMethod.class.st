Class {
	#name : #RAMethod,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#keywords => ToManySlot inClass: #RAKeywordDefinition containment: true',
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true',
		'#statements => ToManySlot inClass: #RAStatement containment: true',
		'#owningClass => ToOneSlot inverse: #methods inClass: #RAClass'
	],
	#category : #'ReflexiveAST-core-core'
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

{ #category : #accessing }
RAMethod >> hasArguments [
	^ self arguments size > 1
]

{ #category : #accessing }
RAMethod >> hasTemporaries [
	^ temporaries isNotEmpty 
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
RAMethod >> name: aName [
	keywords ifEmpty: [ keywords add: (RAKeywordDefinition new) ].
	(keywords size = 1) ifFalse: [ ^ self ].
	(keywords at: 1) name: aName.
	
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
