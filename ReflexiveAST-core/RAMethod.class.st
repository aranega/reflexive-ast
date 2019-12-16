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
	^ (keywords collect: [ :each | each argument ]) select: #isNotNil
]

{ #category : #'rbast-polymorphic' }
RAMethod >> body [
	^ self statements
]

{ #category : #'rbast-polymorphic' }
RAMethod >> compilationContext [
	^ Smalltalk compiler compilationContextClass new
		class: (owningClass originClass ifNil: [ UndefinedClass ])
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

{ #category : #'rbast-polymorphic' }
RAMethod >> lastIsReturn [ 
	^ self statements last isReturn 
]

{ #category : #'rbast-polymorphic' }
RAMethod >> methodProperties [
	^ nil
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

{ #category : #'rbast-polymorphic' }
RAMethod >> pragmas [
	^ #()
]

{ #category : #'rbast-polymorphic' }
RAMethod >> primitiveFromPragma [
	^ IRPrimitive null
]

{ #category : #'rbast-polymorphic' }
RAMethod >> scope [
	^ self
]

{ #category : #accessing }
RAMethod >> selector [
	^ keywords inject: '' into: [ :res :each | res, each name asString ]
]

{ #category : #accessing }
RAMethod >> statements [
	^ statements
]

{ #category : #'rbast-polymorphic' }
RAMethod >> tempVarNames [
	^ self temporaries collect: [ :temp | temp name ].
]

{ #category : #'rbast-polymorphic' }
RAMethod >> tempVector [
	^ self temporaries 
]

{ #category : #accessing }
RAMethod >> temporaries [
	^ temporaries
]
