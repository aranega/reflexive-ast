Class {
	#name : #RABlock,
	#superclass : #RAExpression,
	#instVars : [
		'#statements => ToManySlot inClass: #RAStatement containment: true',
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true',
		'#arguments => ToManySlot inClass: #RAArgumentDefinition containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RABlock >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitBlock: self
]

{ #category : #accessing }
RABlock >> accessibleArguments [
	^ self arguments, self parent accessibleArguments 
]

{ #category : #accessing }
RABlock >> arguments [
	^ arguments
]

{ #category : #initialization }
RABlock >> initialize [
	super initialize.
]

{ #category : #accessing }
RABlock >> statements [
	^ statements
]

{ #category : #accessing }
RABlock >> temporaries [
	^ temporaries
]
