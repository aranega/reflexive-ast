Class {
	#name : #RABlock,
	#superclass : #RAExpression,
	#instVars : [
		'#statements => ToManySlot inClass: #RAStatement containment: true',
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true',
		'#arguments => ToManySlot inClass: #RAArgumentDefinition containment: true'
	],
	#category : #'ReflexiveAST-core-core'
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

{ #category : #accessing }
RABlock >> hasArguments [
	^ self arguments isNotEmpty
]

{ #category : #accessing }
RABlock >> hasTemps [
	^ self temporaries isNotEmpty
]

{ #category : #initialization }
RABlock >> initialize [
	super initialize.
]

{ #category : #accessing }
RABlock >> isBlock [
	^ true
]

{ #category : #accessing }
RABlock >> statements [
	^ statements
]

{ #category : #accessing }
RABlock >> temporaries [
	^ temporaries
]
